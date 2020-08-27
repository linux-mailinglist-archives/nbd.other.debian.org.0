Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 24474254B76
	for <lists+nbd@lfdr.de>; Thu, 27 Aug 2020 19:03:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04E1C20290; Thu, 27 Aug 2020 17:03:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 27 17:03:42 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CCF9520240
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Aug 2020 17:03:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8cRJyp8gf8YZ for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Aug 2020 17:03:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 157350 seconds by postgrey-1.36 at bendel; Thu, 27 Aug 2020 17:03:29 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id D6D7720223
	for <nbd@other.debian.org>; Thu, 27 Aug 2020 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598547804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FplCRyEw7tETF4q7zSPlQjQ3VR3zcYU4sGkvVYhUqpw=;
	b=OyUAI94nJSU6jCRokl/1SN30O+YhjEu4/f+7E1Xku1xPWrmofgmdUmEvDIer3diPlOu+qd
	iUwulTrUpGlFw5QBKjYgD1X8r1+3otQCXSXHLSLqWWsqeD9vWODMw6FuOQn/3lB2xxqEiS
	GmvIVgdFmgjOKCZDzpIHgE/q4QBQ0OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-80XWgHaUPXapDdum68pYwg-1; Thu, 27 Aug 2020 13:03:09 -0400
X-MC-Unique: 80XWgHaUPXapDdum68pYwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE59802B79
	for <nbd@other.debian.org>; Thu, 27 Aug 2020 17:03:08 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF7D5C1C2;
	Thu, 27 Aug 2020 17:03:02 +0000 (UTC)
Date: Thu, 27 Aug 2020 18:03:01 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, virt-tools-list@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: nbdkit 1.22 - high performance NBD server
Message-ID: <20200827170301.GU16477@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bBmQKJP4mAE.A.JED.ud-RfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/959
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200827170301.GU16477@redhat.com
Resent-Date: Thu, 27 Aug 2020 17:03:43 +0000 (UTC)

I'm pleased to announce the release of nbdkit 1.22, a high performance
plugin-based Network Block Device (NBD) server.
https://en.wikipedia.org/wiki/Network_block_device

Key features of nbdkit:

 * Multithreaded NBD server written in C with good performance.
 * Minimal dependencies for the basic server.
 * Liberal license (BSD) allows nbdkit to be linked to proprietary
   libraries or included in proprietary code.
 * Well-documented, simple plugin API with a stable ABI guarantee.
   Lets you export “unconventional” block devices easily.
 * You can write plugins in C, Go, Lua, Perl, Python, OCaml, Ruby,
   Rust, shell script or Tcl.
 * Filters can be stacked in front of plugins to transform the output.

Git:      https://github.com/libguestfs/nbdkit
Download: https://download.libguestfs.org/nbdkit/1.22-stable/
Fedora:   https://koji.fedoraproject.org/koji/packageinfo?packageID=16469
Debian:   https://packages.debian.org/nbdkit

Release notes (http://libguestfs.org/nbdkit-release-notes-1.22.1.html)

       These are the release notes for nbdkit stable release 1.22.  This
       describes the major changes since 1.20.

       nbdkit 1.22.0 was released on 27 August 2020.

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       New nbdkit-cdi-plugin(1) (Containerized Data Importer) lets you export
       a single layer from a container image, allowing you to access disk
       images distributed using container registry infrastructure.

       New nbdkit-ondemand-plugin(1) creates filesystems for clients on
       demand.

       New nbdkit-torrent-plugin(1) serves a BitTorrent file or magnet link
       over NBD.

       nbdkit-data-plugin(1) and nbdkit-memory-plugin(1) have a new
       "allocator" parameter giving more fine-grained control over the
       allocation strategy.  Currently implemented strategies are: sparse
       array, sparse array with zstd compression, malloc, and malloc with
       mlock.

       nbdkit-data-plugin(1) data format now supports strings and alignment.
       The "disk2data.pl" script has been enhanced to detect repeated
       sequences and produce a more compact output.

       nbdkit-curl-plugin(1) adds support for arbitrary custom request
       headers.  Also it now supports scripts for generating cookies and
       custom request headers.  This is especially useful when accessing web
       servers that require authentication which has to be renewed
       periodically.

       nbdkit-curl-plugin(1) now supports HTTP/2 servers (David Edmondson,
       Pino Toscano, Zi Liu).

       nbdkit-curl-plugin(1) adds support for the "User-Agent" header.

       nbdkit-file-plugin(1) can export multiple files in a directory as
       separate exports (Eric Blake).

       nbdkit-file-plugin(1) supports new "cache=none" and
       "fadvise=normal|random|sequential" parameters which can be used to
       optimize access patterns and avoid filling the page cache.

       nbdkit-nbd-plugin(1) supports proxying to another NBD server over
       "AF_VSOCK" (Eric Blake).

       nbdkit-nbd-plugin(1) supports new "command=" and "socket-fd="
       parameters which allow you to run a subordinate NBD server as a command
       directly from the plugin, or pass in an already connected NBD endpoint.

       nbdkit-streaming-plugin(1) supports streaming to and from local pipes.

       nbdkit-vddk-plugin(1) now has support for VDDK 7.0.  A new and useless
       "error" message printed by VDDK 7 has been suppressed (thanks Ming Xie,
       Pino Toscano).

       nbdkit-ext2-plugin(1) has been removed.  It was deprecated in
       nbdkit 1.17.8.  All existing uses can be replaced with
       nbdkit-ext2-filter(1).

       The "-" character is now permitted within plugin and filter names (Eric
       Blake).

   Filters
       New nbdkit-ddrescue-filter(1) lets you test disk images recovered by
       ddrescue(1) (François Revol).

       New nbdkit-gzip-filter(1) can decompress a plugin that contains gzip-
       compressed data.  It replaces nbdkit-gzip-plugin(1) which is deprecated
       and will be removed in nbdkit 1.26.

       New nbdkit-pause-filter(1) can temporarily stop and later resume NBD
       requests.  This can be used when taking snapshots.

       New nbdkit-swab-filter(1) swaps bytes in the underlying plugin, which
       can be used to adjust images that have an incorrect byte order
       (François Revol).

       New nbdkit-tar-filter(1) reads and writes files inside a tar file in
       the underlying plugin.  It replaces nbdkit-tar-plugin(1) which is
       deprecated and will be removed in nbdkit 1.26.

       New nbdkit-tls-fallback-filter(1) provides alternate content when a
       client connects without using TLS to a server that permits but does not
       require TLS (Eric Blake).

       nbdkit-fua-filter(1) has new option "fuamode=pass" to pass through FUA
       and flush requests unchanged (disabling the filter).  A new, unsafe
       "fuamode=discard" mode was added which discards FUA and flush requests.

   Language bindings
       New nbdkit-cc-plugin(3) lets you write small nbdkit plugins as inline
       C, C++ or OCaml "scripts" (and potentially other ahead-of-time compiled
       programming languages).

       nbdkit-rust-plugin(3) bindings have been replaced by higher level and
       more idiomatic bindings.  These also support a greater range of server
       features (Alan Somers).

       nbdkit-python-plugin(3) now supports parallel plugins.  These cannot
       run Python code in parallel (because of the Python GIL), but for Python
       code that blocks, eg. calling out to external services, requests can
       now be handled in parallel (thanks Nir Soffer).

       nbdkit-python-plugin(3) has a greater range of examples (Nir Soffer).

       nbdkit-python-plugin(3) adds support for getting the client export
       name, calling "nbdkit_debug", and also for extents.

   Server
       "nbdkit --dump-config" has new fields: "version_major" and
       "version_minor" to allow easier version parsing from scripts.
       "host_cpu" and "host_os" so you can find out if nbdkit was cross-
       compiled for another platform.  "zstd=(yes|no)" so you can find out if
       nbdkit was compiled with zstd compression support.

       The -e/--exportname option (which never did anything useful previously)
       is now used to pass the preferred exportname to the --run option.  In
       general you should never use this option except in very limited and
       exceptional circumstances (Eric Blake).

   API
       New ".after_fork" callback which can be used for plugins which need to
       create background threads, since those threads would otherwise be
       stranded if the server forks into the background.  The VDDK plugin now
       defers VDDK library initialization til ".after_fork" because it is
       thought that the library creates background threads especially when
       accessing remote servers.

       New API "nbdkit_extents_aligned" is a helper function for filters that
       retrieves extents as needed until at least a certain range is covered
       (Eric Blake).

       New "nbdkit_is_tls" can be called to determine if TLS was negotiated on
       the connection.  Plugins could use this to hide certain exports from
       non-authenticated/non-encrypted clients (Eric Blake).

       "nbdkit_read_password" with "password=-" will now return an error if
       the input is not a tty.  Also "password=-FD" is disallowed if the file
       descriptor is 0, 1 or 2.

   Bug fixes
       The VDDK plugin was extensively refactored to fix many bugs: Reading
       passwords from a tty should work again.  The plugin should now work
       properly when daemonized or using the --run option.  The threading
       model has been relaxed to "SERIALIZE_REQUESTS" which should give small
       performance improvements when using multiple connections.

       The "base64" option of nbdkit-data-plugin(1) has been fixed so it sets
       the implicit size correctly.

       The "<FILE" formatter of nbdkit-data-plugin(1) now works if you use it
       more than once.

   Documentation
       New nbdkit-client(1) manual page documents how to mount filesystems
       from NBD exports on client machines, either directly or using systemd
       mountpoints.

       Examples now use "NBDKIT_API_VERSION 2" so that the examples match the
       documentation.

   Tests
       The tests should now pass on OpenBSD ≥ 6.4.

       tests/Makefile.am was refactored: There is now no longer a single
       massive "EXTRA_DIST".  Creation of test disks was refactored.

       Some tests will now use new libnbd 1.4 tools nbdcopy(1) and nbdinfo(1)
       if available, and skip the tests otherwise.

       New test functions "requires_plugin" and "requires_filter" allows tests
       to be skipped if the corresponding plugin/filter was not compiled on a
       particular platform.  So tests should now not fail when an optional
       external library needed by a plugin/filter is not available.

   Build
       Honggfuzz may now be used for fuzz testing.

       If nbdkit-python-plugin(3) is enabled, Python ≥ 3.6 must be used.

   Internals
       The export name is now passed down through filter ".open" callbacks,
       allowing filters to modify the export name passed through to plugins.

       The final thread model is passed to filter ".get_ready" callbacks.

SEE ALSO
       nbdkit(1).

AUTHORS
       Authors of nbdkit 1.22:

       Alan Somers
           (7 commits)

       Eric Blake
           (53 commits)

       François Revol
           (2 commits)

       Nir Soffer
           (2 commits)

       Richard W.M. Jones
           (285 commits)



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

