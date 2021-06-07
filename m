Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481339E2D6
	for <lists+nbd@lfdr.de>; Mon,  7 Jun 2021 18:21:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75CB72025F; Mon,  7 Jun 2021 16:21:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  7 16:21:49 2021
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BFBB12029E
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Jun 2021 16:21:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.132 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.374, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nG70LDGrNzZ1 for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Jun 2021 16:21:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 376 seconds by postgrey-1.36 at bendel; Mon, 07 Jun 2021 16:21:36 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id B79A820298
	for <nbd@other.debian.org>; Mon,  7 Jun 2021 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623082891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hlb3YJojX7k6HlqZ8hHto0cP6uHh96yy4kvGbzW4hnQ=;
	b=XWd1fNIzbJM/IhLaTco49+g27uzkDJ3g0ZNypmzT7A8Mx8x16KyXUCfHE42A5GS3yW/vZV
	tiqCoXY8wOWF5z26raGqAbhOeSwJ2QwjioIX8NrnNy8wpUvxgdjv2275NDBcdsSYY4dLut
	HLYIqPzZY4SMaAR0NrHuB9wPKI+7HT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-6-WWC4NGPCCjrCev_pbTfw-1; Mon, 07 Jun 2021 12:15:10 -0400
X-MC-Unique: 6-WWC4NGPCCjrCev_pbTfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94E008ABA42
	for <nbd@other.debian.org>; Mon,  7 Jun 2021 16:15:09 +0000 (UTC)
Received: from localhost (ovpn-114-133.ams2.redhat.com [10.36.114.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3650B620DE;
	Mon,  7 Jun 2021 16:14:59 +0000 (UTC)
Date: Mon, 7 Jun 2021 17:14:59 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, virt-tools-list@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: libnbd 1.8 and nbdkit 1.26 - high performance network
 block device client and server
Message-ID: <20210607161459.GP30099@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3LkbSZPhsW.A.B3E.dekvgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1210
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210607161459.GP30099@redhat.com
Resent-Date: Mon,  7 Jun 2021 16:21:49 +0000 (UTC)

I'm pleased to announce the release of nbdkit 1.26, a high performance
plugin-based Network Block Device (NBD) server, and libnbd 1.8, a high
performance client library.

https://en.wikipedia.org/wiki/Network_block_device

You can get these from:

tarballs: https://download.libguestfs.org/nbdkit/
          https://download.libguestfs.org/libnbd/
git:      https://gitlab.com/nbdkit

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

Key features of libnbd:

 * Synchronous API for ease of use.
 * Asynchronous API for writing non-blocking, multithreaded clients.
   You can mix both APIs freely.
 * High performance.
 * Minimal dependencies for the basic library.
 * Well-documented, stable API.
 * Bindings in several programming languages.
 * Shell (nbdsh) for command line and scripting.
 * Copying tool (nbdcopy) for high performance copying and streaming.
 * Query tool (nbdinfo) to query NBD servers.
 * FUSE support (nbdfuse) to mount NBD in the local filesystem.

Release notes for nbdkit 1.26

       nbdkit is now hosted on gitlab:
       https://listman.redhat.com/archives/libguestfs/2021-February/msg00021.html

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       nbdkit-gzip-plugin and nbdkit-tar-plugin have been removed.  They were
       deprecated in nbdkit 1.22.  The functionality has been replaced by
       nbdkit-gzip-filter(1) and nbdkit-tar-filter(1) respectively.

       nbdkit-streaming-plugin(1) has been deprecated and will be removed in
       nbdkit 1.30.  You can use nbdcopy(1) instead.

       nbdkit-curl-plugin(1) adds these features: "followlocation=false" to
       disable following redirects.  "cookiefile" and "cookiejar" to control
       saving cookies.

       nbdkit-ssh-plugin(1) now advertises multi-conn if the server is
       OpenSSH, improving performance (Eric Blake).

       nbdkit-ondemand-plugin(1) has a new "wait=true" flag allowing you to
       choose between clients waiting for an export to become free or being
       immediately rejected.

       nbdkit-sparse-random-plugin(1) now does not generate fully random data
       within each block.  Using perf we observed that the plugin was spending
       34% of the total time during benchmarks just doing this.  You can
       enable the old behaviour using "random-content=true".

       nbdkit-file-plugin(1) now checks if the file is read-only and exports a
       read-only NBD connection in this case (Eric Blake).

       nbdkit-vddk-plugin(1) has been tested with VDDK 7.0.2.

   Filters
       There is a new API for use by filters to manage "contexts".  Instead of
       the previous 1-1 relationship between filter connections and plugin
       connections, filters can now open more than one context into the
       backend from a single connection, or share contexts between connections
       (Eric Blake).

       New nbdkit-multi-conn-filter(1) which allows you to add multi-conn
       support to plugins which don't support it (although the emulation is
       expensive), or change whether multi-conn is advertised to clients (Eric
       Blake).

       nbdkit-cow-filter(1) now ignores flush/FUA requests (which are not
       useful for a temporary overlay).  The filter now implements extents and
       efficient trimming.  Fine-grained locking is used around shared
       structures, greatly improving parallel performance.  Added support for
       multi-conn.

       nbdkit-cache-filter(1) advertises multi-conn when possible (Eric
       Blake).

       nbdkit-cache-filter and nbdkit-cow-filter can now handle arbitrary
       sized disks, instead of rounding the disk size down.

       nbdkit-blocksize-filter(1) supports parallel requests (Eric Blake).

       nbdkit-checkwrite-filter(1) supports multi-conn (Eric Blake).

       nbdkit-ext2-filter(1) no longer supports multi-conn.  The filter is
       single-threaded so it does not matter, but it was not safe.  Fix trim,
       zero and flush support (Eric Blake).

       nbdkit-readahead-filter(1) fixes multi-conn support (Eric Blake).

       nbdkit-gzip-filter(1) and nbdkit-xz-filter(1) now both support multi-
       conn (Eric Blake).

   Language bindings
       nbdkit-python-plugin(3) supports the following new features:
       "after_fork" and "preconnect" methods.  "nbdkit.shutdown()" binding.

       nbdkit-rust-plugin(3) updated for newer Rust compiler versions (Alan
       Somers).

       nbdkit-golang-plugin(3) now uses and requires golang modules.  Golang ≥
       1.13 must be used.

   API
       New ".cleanup" callback for plugins and filters.  This is called
       shortly before ".unload", but unlike ".unload" it is guaranteed that no
       plugin or filter code has been dlclosed (Eric Blake).

       New "nbdkit_extents_full" is a helper function for filters which can be
       used to read all extents from a plugin covering a region.

   Tests
       Old plugins that we use for testing were rebuilt so they no longer
       depend on libselinux (thanks Thomas Weißschuh).

       nbdkit-ssh-plugin(1) can still be built even if ssh-keygen is
       unavailable for testing it (thanks Thomas Weißschuh).

       Improve tests/test-captive.sh to avoid crashes during testing.

       Test coverage on FreeBSD has been improved, fewer tests should skip
       unnecessarily.

   Build
       nbdkit and plugins can now be built with "-fvisibility=hidden", which
       allows the compiler to make some optimizations.

       Add a dependency so nbdkit is relinked if the linker script
       (nbdkit.syms) changes (Eric Blake).

       xorriso is now preferred over genisoimage or mkisofs (see
       https://wiki.debian.org/genisoimage).

       It is now possible to compile nbdkit with clang with warnings enabled.
       Several warnings have been suppressed or fixed.

       "MALLOC_CHECK_" and "MALLOC_PERTURB_" are only enabled when running the
       tests, not when running nbdkit from the build directory.  This makes it
       easier to do benchmarks.

       "nbdkit_peer_*" implemented on OpenBSD.

   Internals
       When fuzzing nbdkit we now recommend using the "-t 1" flag (which
       disables threads).  This improves the fuzz-stability of nbdkit.

AUTHORS
       Authors of nbdkit 1.26:

       •   Alan Somers

       •   Eric Blake

       •   Michael Ablassmeier

       •   Richard W.M. Jones

       •   Timm Bäder


Release notes for libnbd 1.8

       libnbd is now hosted on gitlab:
       https://listman.redhat.com/archives/libguestfs/2021-February/msg00021.html

   Security
       If you find a security issue, please read SECURITY in the source
       (online here: https://gitlab.com/nbdkit/libnbd/blob/master/SECURITY).
       To find out about previous security issues in libnbd, see
       libnbd-security(3).

       There was one security bug found in libnbd during this release cycle.

       CVE-2021-20286 denial of service when using nbd_set_opt_mode(3)

       See the full announcement here:
       https://listman.redhat.com/archives/libguestfs/2021-March/msg00092.html
       (Found and fixed by Eric Blake).

   New APIs
       nbd_get_private_data(3)
       nbd_set_private_data(3)
           These calls allow you to store either an unsigned integer or a
           pointer in the handle for the application to use for its own
           purposes.

       nbd_get_uri(3)
           This call constructs an NBD URI which can be used to connect back
           to the same server (using nbd_connect_uri(3) or from other tools
           that support the NBD URI standard).

   Enhancements to existing APIs
       Numeric IPv6 URIs (like "nbd://[::1]/") are now supported.

       libnbd gives a better error message if the server backlog overflows
       (thanks Xin Long, Lukas Doktor, Eric Blake, Martin Kletzander).

   New features
       Continuous integration (CI) tests now run on every commit and merge
       request to the upstream repository (Martin Kletzander).

   Tools
       A great deal of work has been done to improve the performance of
       nbdcopy(1) (Nir Soffer, Eric Blake).

       On Linux, nbdcopy now uses readahead when reading from files, and takes
       steps to preserve the host page cache.

       nbdcopy new --request-size option to allow controlling the size of
       requests made to NBD servers.  Adjusting this can affect performance
       (Nir Soffer).

       nbdcopy now supports "null:" pseudo-target, where it discards the
       output.  This is useful for benchmarking.

       nbdcopy new -v flag to enable libnbd and other debugging.

       nbdinfo(1) --list (which lists all exports of a server) no longer exits
       early if one of the exports is inaccessible or there is a recoverable
       error (Eric Blake).

       nbdinfo now prints the URI of each export in the output making it
       easier to connect back to each export.

       nbdfuse(1) is now multithreaded and supports issuing parallel NBD
       commands on a single connection as well as multi-conn, and other
       enhancements have been made.  This resulted in around 50% performance
       improvement when tested with fio.

       nbdfuse now supports nbdcopy-style "[ CMD ]", eg:
        nbdfuse dir/ramdisk [ nbdkit memory 1G ]

       nbdfuse now supports trimming.  Also it supports fast zeroing, but this
       requires a forthcoming kernel patch before it will work.

       nbdfuse sets the virtual file permissions appropriately if the NBD
       export is read-only.

       nbdfuse new -v flag to enable libnbd and other debugging.

   Tests
       Added a test of interoperability with qemu-storage-daemon(1).  Note
       that qemu-storage-daemon was broken in qemu 6.0.0 so this test can fail
       unless you update to a fixed version (thanks Stefan Hajnoczi, Daniel
       Berrangé).

       Added a test of nbdcopy with TLS which was previously untested.

       Python code style tests are now opt-in using
        ./configure --enable-python-code-style

       More tests should now run on FreeBSD and not be skipped.

       nbdfuse tests now ensure that errors from NBD are transmitted through
       FUSE back to the local client.

       "MALLOC_CHECK_" and "MALLOC_PERTURB_" are only enabled when running the
       tests, not when running libnbd programs from the build directory.  This
       makes it easier to do benchmarks.

   Other improvements and bug fixes
       The minimum C compiler is now ISO C99 (previously ANSI C90).

       FUSE 3 (instead of FUSE 2) is now required to build nbdfuse.

       The library tries harder not to leak thread-local storage memory on
       dlclose or exit.  (Because of the design of Linux it is not always
       possible to avoid this, especially in multithreaded programs.)

       Fix the progress bar in nbdcopy(1).

       UTF-8 export names are now processed and displayed properly by
       nbdinfo(1).

       The --help output of nbdcopy, nbdfuse and nbdinfo now displays a brief
       summary of all options and has some examples.

       The generator now only requires ocamlc, not ocamlfind (Abhay Raj
       Singh).

       Golang bindings now use and require golang modules.

   Documentation
       Document using libnbd with the Meson build system.

       Added Python examples.

       Add example of how to integrate libnbd with libev (Nir Soffer).

AUTHORS
       Eric Blake

       Richard W.M. Jones

       Martin Kletzander

       Nir Soffer



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

