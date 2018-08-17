// HTML elements
var $body = $('body')
var $progressBar = $('#progressBar')
var $streamedFileName = $('#streamedFileName')
var $numPeers = $('#numPeers')
var $downloaded = $('#downloaded')
var $total = $('#total')
var $remaining = $('#remaining')
var $uploadSpeed = $('#uploadSpeed')
var $downloadSpeed = $('#downloadSpeed')
var client = new WebTorrent()

client.on('error', function(err) {
  console.error('ERROR: ' + err.message)
})

// Download by form input
$('form').submit(function(e) {
  e.preventDefault() // Prevent page refresh

  var torrentId = $('form input[name=torrentId]').val()

  if (torrentId.length > 0)
      client.add(torrentId, onTorrent)
})

// Download by URL hash
onHashChange()
window.addEventListener('hashchange', onHashChange)
function onHashChange () {
  var hash = decodeURIComponent(window.location.hash.substring(1)).trim()
  if (hash !== '') downloadTorrent(hash)
}

function onTorrent(torrent) {

  var player = null;

  // Find largest file
  var largestFile = torrent.files[0]
  for (var i = 1; i < torrent.files.length; i++) {
    if (torrent.files[i].length > largestFile.length)
      largestFile = torrent.files[i]
  }

  // Display name of the file being streamed
  $streamedFileName.html(largestFile.name)
  
  // Stream the file in the browser
  largestFile.renderTo('video#my-video', function() {
    player(document.querySelector('.video-js'));
    player.play();
  });

  // hide magnet input
  $('#magnet-input').slideUp()


  // Trigger statistics refresh
  torrent.on('done', onDone)
  setInterval(onProgress, 500)
  onProgress()

  // Statistics
  function onProgress () {
    // Peers
    $numPeers.html(torrent.numPeers + (torrent.numPeers === 1 ? ' peer' : ' peers'))

    // Progress
    var percent = Math.round(torrent.progress * 100 * 100) / 100
    $progressBar.width(percent + '%')
    $downloaded.html(prettyBytes(torrent.downloaded))
    $total.html(prettyBytes(torrent.length))

    // Remaining time
    var remaining
    if (torrent.done) {
      remaining = 'Done'
    } else {
      remaining = moment.duration(torrent.timeRemaining / 1000, 'seconds').humanize()
      remaining = remaining[0].toUpperCase() + remaining.substring(1) + ' remaining'
    }
    $remaining.html(remaining)

    // Speed rates
    $downloadSpeed.html(prettyBytes(torrent.downloadSpeed) + '/s')
    $uploadSpeed.html(prettyBytes(torrent.uploadSpeed) + '/s')
  }

  function onDone () {
    $body.className += ' is-seed'
    onProgress()
  }
}

// Human readable bytes util
function prettyBytes(num) {
  var exponent, unit, neg = num < 0, units = ['B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
  if (neg)
    num = -num
  if (num < 1) return (neg ? '-' : '') + num + ' B'
    exponent = Math.min(Math.floor(Math.log(num) / Math.log(1000)), units.length - 1)
  num = Number((num / Math.pow(1000, exponent)).toFixed(2))
  unit = units[exponent]
  return (neg ? '-' : '') + num + ' ' + unit
}