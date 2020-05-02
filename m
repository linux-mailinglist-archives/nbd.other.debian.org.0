Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB21C248E
	for <lists+nbd@lfdr.de>; Sat,  2 May 2020 13:01:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D9157203E6; Sat,  2 May 2020 11:01:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May  2 11:01:58 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAFFB202E2
	for <lists-other-nbd@bendel.debian.org>; Sat,  2 May 2020 11:01:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4c6cGM_vP5bY for <lists-other-nbd@bendel.debian.org>;
	Sat,  2 May 2020 11:01:46 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id D496C201CC
	for <nbd@other.debian.org>; Sat,  2 May 2020 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588417300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9KP+B4hPOzJGAVXdaxzVEXLQehaSE2wmPTV9p8fgqQk=;
	b=LkI/JGz7Ow3TLFyO0zoapkRWih/h7ix7K9XYKBqclM8Rl7FWVW2VNy/F9hOOcyrGar/9sO
	xxDLYEJXiG+CmfzjbUBzai+o9BHaqPDuRrYJo4r3SFpkdHGkpbcNKwfK5r7wWTOlURY9oF
	aesWN9V8xmAlDbnV/nbABDYg6g6Gv4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-Mi2sjAPwPt-egGSdJ1LrmQ-1; Sat, 02 May 2020 07:00:18 -0400
X-MC-Unique: Mi2sjAPwPt-egGSdJ1LrmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1033835B43
	for <nbd@other.debian.org>; Sat,  2 May 2020 11:00:17 +0000 (UTC)
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62F6850F6D;
	Sat,  2 May 2020 11:00:03 +0000 (UTC)
Date: Sat, 2 May 2020 12:00:02 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, virt-tools-list@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: nbdkit 1.20 - high performance NBD server
Message-ID: <20200502110002.GT16477@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5cbLx8f4DrN.A.uZH.mMVreB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/876
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200502110002.GT16477@redhat.com
Resent-Date: Sat,  2 May 2020 11:01:58 +0000 (UTC)

I'm pleased to announce the release of nbdkit 1.20, a high performance
plugin-based Network Block Device (NBD) server.
https://en.wikipedia.org/wiki/Network_block_device

Key features of nbdkit:

 * Multithreaded NBD server written in C with good performance.
 * Minimal dependencies for the basic server.
 * Liberal license (BSD) allows nbdkit to be linked to proprietary
   libraries or included in proprietary code.
 * Well-documented, simple plugin API with a stable ABI guarantee.
   Lets you export =E2=80=9Cunconventional=E2=80=9D block devices easily.
 * You can write plugins in C, [new!] Go, Lua, Perl, Python, OCaml,
   Ruby, Rust, shell script or Tcl.
 * Filters can be stacked in front of plugins to transform the output.

Git: https://github.com/libguestfs/nbdkit
Download: http://download.libguestfs.org/nbdkit/1.20-stable/
Fedora: https://koji.fedoraproject.org/koji/packageinfo?packageID=3D16469

Release notes (http://libguestfs.org/nbdkit-release-notes-1.20.1.html)

       These are the release notes for nbdkit stable release 1.20.  This
       describes the major changes since 1.18.

       nbdkit 1.20.0 was released on 2nd May 2020.

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       New nbdkit-tmpdisk-plugin(1) is a scriptable =E2=80=9Cremote tmpfs=
=E2=80=9D for
       creating temporary filesystems (eg. for thin clients), and also for
       blank or prepopulated temporary disks.

       nbdkit-data-plugin(1) now has support for prepopulating disks with m=
ore
       complex test patterns such as repeated sequences of bytes.

       nbdkit-curl-plugin(1) now supports setting a proxy, enabling TCP
       keepalives, and disabling Nagle=E2=80=99s algorithm.

       nbdkit-perl-plugin(1) now supports API version 2.  In particular the
       full NBD client flags are visible to plugins, along with support for
       the ".get_ready" callback.  Also there is a new function
       "Nbdkit::debug" which is a wrapper around the "nbdkit_debug" API.

       nbdkit-vddk-plugin(1) drops support for VDDK 5.1.1.  This version wa=
s
       last updated in 2014 and is no longer supported by VMware.  Since th=
is
       was the last version of VDDK to support i686, 32-bit support is also
       dropped (Eric Blake).

   Language bindings
       Plugins may now be written in Golang, see nbdkit-golang-plugin(3)
       (thanks Dan Berrang=C3=A9, James Shubin).

       OCaml plugins can now access "nbdkit_realpath", "nbdkit_nanosleep",
       "nbdkit_export_name" and "nbdkit_shutdown".

       Python plugins now transparently support fail-fast zero (Eric Blake)=
.

   Filters
       New nbdkit-exitlast-filter(1) causes nbdkit to exit after the last
       client connection.

       New nbdkit-limit-filter(1) allows you to limit the number of clients
       which can simultaneously connect to any plugin.

   Server
       The --run option now waits for the nbdkit plugin and nbdkit to exit
       before returning to the caller.  This allows for more predictable cl=
ean
       up in shell scripts using this feature.

       nbdkit --dump-config output now includes separate lines for
       "version_major" and "version_minor", making it easier to find out fr=
om
       shell scripts which version of nbdkit is installed.

       nbdkit -s option (which connects to the client over stdin/stdout) no=
w
       rejects various options that would also try to read from or write to
       stdin/stdout, for example --dump-plugin or "password=3D-" (Eric Blak=
e).

   API
       New "nbdkit_shutdown" call which allows plugins to ask for nbdkit to
       exit.  This is used to implement the new "exitlast" filter.

       New "nbdkit_stdio_safe" call allows plugins to check if reading from
       stdin or writing to stdout is safe, eg. if it is safe to read passwo=
rds
       interactively (Eric Blake).

       "can_*" callbacks which return booleans can return any value =E2=89=
=A5 1 to
       mean true.  Previous versions of nbdkit had inconsistent behaviour i=
f
       plugins returned anything other than 1 for true (Eric Blake).

   Bug fixes
       nbdkit-tar-plugin(1) now works and there is a regression test for it=
.

       nbdkit-curl-plugin(1) "-D curl.version=3D1" option now works.

       Fixed a rare hang when closing a connection in nbdkit-nbd-plugin(1)
       (Eric Blake).

       Fix compilation on certain platforms with clang (Khem Raj).

       Don=E2=80=99t leak $tmpdir from nbdkit-sh-plugin(1) into the --run s=
ubcommand.

       nbdkit now correctly sets "FD_CLOEXEC" when using systemd socket
       activation (Eric Blake).

   Documentation
       The nbdkit-plugin(3) man page has been overhauled completely to make=
 it
       easier to follow.  Also we now have documentation for how to compile
       plugins in various environments which was missing before.

   Tests
       All valgrind tests now pass.

       =E2=80=9COld plugin=E2=80=9D tests were added for v1.18.2 on x86-64,=
 and a variety of
       old plugins compiled on i686.  The i686 plugins will allow us to tes=
t
       for regressions in 32 bit support.

       Tests of the nbd plugin should now be stable (Eric Blake).

       There is an additional test combining the offset and truncate filter=
s,
       which tests several corner cases as well as providing tests of error
       handling between layers.

   Build
       nbdkit-nbd-plugin(1) now requires libnbd.  (If libnbd is not present=
 at
       build time then this plugin is not built).  The fallback code in thi=
s
       plugin which made NBD connections by constructing NBD command packet=
s
       without using libnbd has been removed (Eric Blake).

       scripts/git.orderfile has been improved so that commands like
       "git diff" and "git show" display OCaml sources in a natural order w=
ith
       interface first followed by implementation.

       Various fixes for MinGW.  Note MinGW / MSYS support is a work in
       progress and not finished yet (Frank Gu).

       Multiple fixes to Haiku build.

       awk(1) is no longer required to run the tests.  It was a =E2=80=9Chi=
dden=E2=80=9D
       required dependency, but all use of it has now been eliminated.

   Internals
       There is now an internal utility library for creating vectors/lists =
of
       objects, for example lists of strings (common/utils/vector.h).  It i=
s
       widely used by the server, plugins and filters.

       README discusses how to use lcov(1) for code coverage reports.

SEE ALSO
       nbdkit(1).

AUTHORS
       Authors of nbdkit 1.20:

       Eric Blake
           (33 commits)

       Khem Raj
           (1 commit)

       Richard W.M. Jones
           (134 commits)

       Frank Gu
           (6 commits)

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

