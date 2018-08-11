<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="<c:url value="/assets/css/status-bar.css" />" rel="stylesheet">
  </head>

  <body>
    <form id="magnet-input">
      <input name="torrentId" placeholder="magnet:"><button type="submit">Play</button>
    </form>

    <div id="hero">
      <div id="output">
        <div id="progressBar"></div>
        <!-- The video player will be added here -->
      </div>

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
    
    <h4>Try <em>copy-pasting</em> this https url of a torrent to the input box:</h4>
    
    <pre>https://webtorrent.io/torrents/sintel.torrent</pre>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>

    <!-- Include the latest version of WebTorrent -->
    <script src="https://cdn.jsdelivr.net/webtorrent/latest/webtorrent.min.js"></script>

    <!-- Moment is used to show a human-readable remaining time -->
    <script src="http://momentjs.com/downloads/moment.min.js"></script>

    <script src="<c:url value="/assets/js/download-torrent.js" />"></script>
  </body>
</html>
