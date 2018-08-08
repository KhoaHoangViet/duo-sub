<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="<c:url value="/assets/css/status-bar.css" />" rel="stylesheet">
  </head>

  <body>
    <div id="hero">
      <div id="output">
        <div id="progressBar"></div>
      </div>
      <div id="status">
        <div>
          <span class="show-leech">Downloading </span>
          <span class="show-seed">Seeding </span>
          <code>
            <a id="torrentLink" href="https://webtorrent.io/torrents/sintel.torrent">sintel.torrent</a>
          </code>
          <span class="show-leech"> from </span>
          <span class="show-seed"> to </span>
          <code id="numPeers">0 peers</code>.
        </div>
        <div>
          <code id="downloaded"></code>
          of <code id="total"></code>
          - <span id="remaining"></span><br/>
          &#x2198;<code id="downloadSpeed">0 b/s</code>
          / &#x2197;<code id="uploadSpeed">0 b/s</code>
        </div>
      </div>
    </div>


    <!-- Include the latest version of WebTorrent -->
    <script src="https://cdn.jsdelivr.net/webtorrent/latest/webtorrent.min.js"></script>

    <!-- Moment is used to show a human-readable remaining time -->
    <script src="http://momentjs.com/downloads/moment.min.js"></script>

    <script src="<c:url value="/assets/js/download-torrent.js" />"></script>
  </body>
</html>
