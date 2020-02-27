Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7E1722C9
	for <lists+nbd@lfdr.de>; Thu, 27 Feb 2020 17:05:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE48D20736; Thu, 27 Feb 2020 16:05:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 27 16:05:43 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E196C2071E
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Feb 2020 16:05:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ij2YvUFtRDO7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Feb 2020 16:05:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 119592051D
	for <nbd@other.debian.org>; Thu, 27 Feb 2020 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582819525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wF8fjPpy96LLKgVa5Z+GuqAjAldd1GcQGzl3MBJ/fGg=;
	b=cgLZgKcAmPwtWDjsnfoO9DZ4FUFUHm8MKBTDt6/lfagxj4g2qwMXIby9Z1hvoIkgbSpnRH
	SCKIg14X7Zy2h4rQg62UvL//9aeQFV5teDGJowwPE4SXVHwMqSuQLOBSVrBFMa5Mo7pY71
	W82CnUP0GJ6RYfr4Pywy2GviQSWLMrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-j9Qa5q26PK-3IgVChB1vUQ-1; Thu, 27 Feb 2020 11:05:14 -0500
X-MC-Unique: j9Qa5q26PK-3IgVChB1vUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20758800D50
	for <nbd@other.debian.org>; Thu, 27 Feb 2020 16:05:13 +0000 (UTC)
Received: from localhost (unknown [10.36.118.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C80CB19C58;
	Thu, 27 Feb 2020 16:05:06 +0000 (UTC)
Date: Thu, 27 Feb 2020 16:05:06 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, virt-tools-list@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: nbdkit 1.18 - high performance NBD server
Message-ID: <20200227160506.GV16477@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r1nE7G236q.A.e8.Xj-VeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/834
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200227160506.GV16477@redhat.com
Resent-Date: Thu, 27 Feb 2020 16:05:43 +0000 (UTC)

I'm pleased to announce the release of nbdkit 1.18, a high performance
plugin-based Network Block Device (NBD) server.

Key features of nbdkit:

 * Multithreaded NBD server written in C with good performance.
 * Minimal dependencies for the basic server.
 * Liberal license (BSD) allows nbdkit to be linked to proprietary
   libraries or included in proprietary code.
 * Well-documented, simple plugin API with a stable ABI guarantee.
   Lets you export =E2=80=9Cunconventional=E2=80=9D block devices easily.
 * You can write plugins in C, Lua, Perl, Python, OCaml, Ruby, Rust,
   shell script or Tcl.
 * Filters can be stacked in front of plugins to transform the output.

Git: https://github.com/libguestfs/nbdkit
Download: http://download.libguestfs.org/nbdkit/1.18-stable/
Fedora: https://koji.fedoraproject.org/koji/packageinfo?packageID=3D16469

Rich.


Release notes (http://libguestfs.org/nbdkit-release-notes-1.18.1.html)

       These are the release notes for nbdkit stable release 1.18.  This
       describes the major changes since 1.16.

       nbdkit 1.18.0 was released on 27th February 2020.

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       New nbdkit-eval-plugin(1) lets you write a plugin entirely on a sing=
le
       command line.  It is similar to nbdkit-sh-plugin(3).

       nbdkit-ext2-plugin(1) is deprecated and will be removed in the next
       release after this one (nbdkit=C2=A01.20).  As a replacement use
       nbdkit-ext2-filter(1) like this:

        nbdkit --filter=3Dext2 file fs.img ext2file=3D/disks/disk.raw

       nbdkit-python-plugin(3) now offers a version 2 API which avoids copy=
ing
       the data buffer, improving performance.  The original protocol (now
       retrospectively called version 1) is still supported for backwards
       compatibility.  The version 1 protocol was also enhanced to support =
the
       buffer protocol for the pread method, and memoryview for pwrite,
       improving performance by reducing copies (Nir Soffer).

       The Python plugin now prints readable stack traces when an exception=
 is
       thrown (Nir Soffer).

       New methods implemented in the Python plugin: cache, can_cache,
       can_zero, can_fast_zero, can_multi_conn, can_fua.

       In nbdkit-curl-plugin(1), new options "cainfo" and "capath" (Wiktor
       Go=C5=82gowski).

       nbdkit-split-plugin(1) now supports extents (Eric Blake).

       In nbdkit-vddk-plugin(1), "file=3D" is now a magic config key, meani=
ng it
       can be omitted in most circumstances (Eric Blake).

       The VDDK plugin now no longer needs $LD_LIBRARY_PATH to be set.  The
       correct library load path is automatically inferred from the "libdir=
"
       parameter (Eric Blake).

       Verbose messages about calls to VDDK functions Read and Write can no=
w
       be suppressed by setting -D=C2=A0vddk.datapath=3D0.

   Filters
       New nbdkit-ext2-filter(1), which replaces the deprecated
       nbdkit-ext2-plugin.  This filter allows you to read and write files
       inside ext2, ext3 or ext4 filesystems.  The new filter has the same
       features as the plugin, and one enhancement: optionally the name of =
the
       file to serve can be picked from the client-supplied exportname.  Th=
e
       old plugin will be removed in nbdkit=C2=A01.20 (Eric Blake).

       New nbdkit-extentlist-filter(1) lets you specify a static list of
       extents from a file which can be placed on top of plugins which don'=
t
       export extent information.

       New nbdkit-ip-filter(1) lets you allow and deny incoming connections=
 by
       client IP address, similar to TCP wrappers or a firewall.

       New nbdkit-nofilter-filter(1) is a null filter, used for testing.

       The stats filter now collects time elapsed per operation, per operat=
ion
       and total rates, and adds stats for the flush method.  The output is
       shown in human sizes making it easier to understand.  (Nir Soffer).

   Server
       New --swap option which allows nbdkit to be safely used to serve swa=
p
       space to the same machine.

       Debug flags (-D) can now be applied to the server core (using
       -D=C2=A0nbdkit.*).  Underscores in debug flags can now be replaced b=
y dots,
       allowing a kind of namespacing.  Debug flags which are not consumed =
now
       no longer give an error, so you can use them without needing to dete=
ct
       if the plugin supports them.  New server debug flags
       -D=C2=A0nbdkit.backend.controlpath=3D0 and -D=C2=A0nbdkit.backend.da=
tapath=3D0 were
       added to suppress some very verbose messages when verbose mode is
       enabled.

   API
       There is a new ".get_ready" method which is called after
       ".config_complete" and before the server forks or changes directory.
       It is the last chance to do any global preparation that is needed to
       serve connections.  Plugins have previously done this work in
       ".config_complete", but by splitting this into a new method it makes
       the API clearer.  (Note that existing plugins may continue to use
       ".config_complete" for this work if they prefer.)

       There is a new ".preconnect" method available which is called just
       after the client makes a connection but before any NBD negotiation o=
r
       TLS authentication is done.  It can be used for early whitelisting o=
r
       rate limiting of connections, and in particular is used by the new
       nbdkit-ip-filter(1).

   Bug fixes
       In nbdkit-curl-plugin(1), "CURLINFO_CONTENT_LENGTH_DOWNLOAD_T" is us=
ed
       (if available) so that file sizes up to 63 bits should now work on a=
ll
       platforms (Pino Toscano and Adrian Ambro=C5=BCewicz).

       nbdkit is now compatible with OCaml 4.10.

       nbdkit-memory-plugin(1) now supports "size=3D0" (Eric Blake).

   Documentation
       Plugins which were actually added in nbdkit=C2=A01.0.0 are now docum=
ented as
       such properly.

       Improved methods for probing plugins and filters are documented in
       nbdkit-probing(1).

   Tests
       Old plugins from nbdkit 1.0, 1.2, 1.8 and 1.12 are now bundled with =
the
       nbdkit sources and tested to try to ensure that they do not
       accidentally regress.  Note these are included as binary blobs.  See
       tests/old-plugins/README for more information about this, including =
how
       to delete these tests.

       Various tests, especially ones which rely on timeouts, have been mad=
e
       more stable so they should not fail on slow or overloaded machines.

       Many tests now use libnbd and nbdsh (instead of libguestfs and
       guestfish) as the test client.  This should improve the performance =
of
       the tests for most people.

       The --vsock option (added in nbdkit 1.16) can now be tested if the h=
ost
       is running Linux =E2=89=A5 5.6 (Stefano Garzarella).

   Build
       You can use "./configure --disable-nbd-plugin" to completely disable
       the NBD plugin.

       The automake feature "subdir-objects" is no longer used, which may
       improve compatibility on platforms with ancient and buggy automake
       (RHEL=C2=A07 being one such platform).

   Internals
       The explicit connection parameter passed around many functions in th=
e
       server is now fetched from thread-local storage.

       The server no longer calls the finalize method if prepare fails.  Al=
so
       failing to reopen the plugin from nbdkit-retry-filter(1) no longer
       hangs (Eric Blake).

       "git.orderfile" was enhanced to make patches easier to read (Eric
       Blake).

       Internal calls to methods like get_size, can_write will now no longe=
r
       produce debug messages if the data is simply being returned from the
       internal cache (but calls into the plugin are still logged).

SEE ALSO
       nbdkit(1).

AUTHORS
       Authors of nbdkit 1.18:

       Adrian Ambro=C5=BCewicz
           (1 commit)

       Eric Blake
           (30 commits)

       Wiktor Go=C5=82gowski
           (1 commit)

       Richard W.M. Jones
           (130 commits)

       Nir Soffer
           (11 commits)

       Pino Toscano
           (1 commit)




--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

