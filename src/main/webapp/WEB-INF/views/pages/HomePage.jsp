<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="<c:url value="/assets/css/status-bar.css" />" rel="stylesheet">
    <link href="https://vjs.zencdn.net/7.1.0/video-js.css" rel="stylesheet">
  </head>

  <body>
    <!-- Video player and progress bar -->
    <div id="hero">
      <div id="progressBar"></div>
      <!-- The video player will be added here -->
      <video id="my-video" class="video-js vjs-styles-defaults" controls preload="none" >
        <p class="vjs-no-js">
          To view this video please enable JavaScript, and consider upgrading to a web browser that
          <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
        </p>
        <track id="subtitleFile" kind="subtitles" srclang="en" label="English" default>
      </video>

      <!-- Statistics -->
      <div id="status">
        <div>
          <span class="show-leech">Downloading </span>
          <span class="show-seed">Seeding </span>
          <code id="streamedFileName"></code>
          <span class="show-leech"> from </span>
          <span class="show-seed"> to </span>
          <code id="numPeers">0 peers</code>
        </div>

        <div>
          <code id="downloaded"></code> of <code id="total"></code> - <span id="remaining"></span>
        </div>

        <div>
          &#x2198;<code id="downloadSpeed">0 b/s</code>/ &#x2197;<code id="uploadSpeed">0 b/s</code>
        </div>
      </div>
    </div>

    <form id="magnet-input">
      <input name="torrentId" placeholder="magnet:"><button type="submit">Play</button>
    </form>

    <h4>Try <em>copy-pasting</em> this https url of a torrent to the input box:</h4>
    
    <pre>https://webtorrent.io/torrents/sintel.torrent</pre>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>

    <!-- Include the latest version of WebTorrent -->
    <script src="https://cdn.jsdelivr.net/webtorrent/latest/webtorrent.min.js"></script>

    <!-- Moment is used to show a human-readable remaining time -->
    <script src="http://momentjs.com/downloads/moment.min.js"></script>

    <!-- Videojs - video player -->
    <script src="https://vjs.zencdn.net/7.1.0/video.js"></script>

    <script src="<c:url value="/assets/js/download-torrent.js" />"></script>
  </body>
</html>
