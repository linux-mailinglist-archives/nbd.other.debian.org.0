Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE17586E95
	for <lists+nbd@lfdr.de>; Mon,  1 Aug 2022 18:34:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F335204BE; Mon,  1 Aug 2022 16:34:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  1 16:34:33 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=CHINA_PRODUCTS_BODY,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,FUZZY_OFFERS,LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_LOW
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B199D204B0
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Aug 2022 16:34:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.524 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CHINA_PRODUCTS_BODY=1, DKIMWL_WL_HIGH=-0.714,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kabUksEztDV4 for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Aug 2022 16:34:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id B94A0204AB
	for <nbd@other.debian.org>; Mon,  1 Aug 2022 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659371653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l1B5bhd2ic48z2CEUN15rJhYeUpvE8evNHl6rrepG/U=;
	b=EfQW5UoKVo6vGgyC1dduePIk5O1+SzcoY6D087913FeJ625eZW6/Aw3M+iioBrUVmyxQNq
	t3/l2Ly3cwzxinHuPgktG/3wDYkA7KdIomuIAEgMevjFWeN4LI9wiqJa5zSTSlxxRm7dE5
	xl/M0qv0qTz7c38r5zdMSCxpqqWLBrk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-kQ4iwNLAOECCoFknZW7YNg-1; Mon, 01 Aug 2022 12:34:12 -0400
X-MC-Unique: kQ4iwNLAOECCoFknZW7YNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6E53817A78
	for <nbd@other.debian.org>; Mon,  1 Aug 2022 16:34:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.98])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C90C400DEF8;
	Mon,  1 Aug 2022 16:34:10 +0000 (UTC)
Date: Mon, 1 Aug 2022 17:34:10 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: nbdkit 1.32 and libnbd 1.14 released
Message-ID: <20220801163410.GY8021@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7HzxNhO0uPN.A.joB.ZCA6iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2207
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220801163410.GY8021@redhat.com
Resent-Date: Mon,  1 Aug 2022 16:34:33 +0000 (UTC)

nbdkit is a Network Block Device (NBD) server with stable plugin ABI
and permissive license.  libnbd is an NBD client library.

I'm pleased to announce the latest stable releases of both projects:
nbdkit 1.32.0 and libnbd 1.14.0.  You can download both from the
download directories here:

https://download.libguestfs.org/nbdkit/
https://download.libguestfs.org/libnbd/

Release notes are online here and attached below:

https://libguestfs.org/nbdkit-release-notes-1.32.1.html
https://libguestfs.org/libnbd-release-notes-1.14.1.html

Thanks to all those who contributed to these releases: Alan Somers,
Eric Blake, Laszlo Ersek, Martin Kletzander, Nikolaus Rath, and Nir
Soffer.

Rich.


----------------------------------------------------------------------

       nbdkit-release-notes-1.32 - release notes for nbdkit 1.32

DESCRIPTION
       These are the release notes for nbdkit stable release 1.32.  This
       describes the major changes since 1.30.

       nbdkit 1.32.0 was released on 1 August 2022.

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       nbdkit-ssh-plugin(1) has new "create=(true|false)", "create-size" and
       "create-mode" parameters to allow remote files to be created.

       nbdkit-S3-plugin(1) was largely rewritten and should have better
       performance and compatibility.  It also supports
       splitting/concatenating multiple S3 objects into one virtual disk.
       (Nikolaus Rath)

   Filters
       New nbdkit-luks-filter(1) allows you to open, read and write LUKSv1
       disk images.  It is compatible with qemu and dm-crypt.

       New nbdkit-scan-filter(1) which simply scans across the disk issuing
       prefetches.

       nbdkit-readahead-filter(1) has been completely rewritten so now it uses
       prefetching from a parallel thread.  The old readahead filter was
       deprecated, but if you are using it you should carefully read the new
       documentation because it may require changes.

       nbdkit-stats-filter(1) now summarises block size and alignment of
       requests (Nikolaus Rath).

       nbdkit-blocksize-filter(1) now handles parallel writes without losing
       writes because of overlapping read-modify-write cycles.  If you are
       using the blocksize filter it is recommended to upgrade.  (Eric Blake)

       nbdkit-rate-filter(1) has a new "burstiness" parameter allowing the
       bucket capacity to be adjusted, which helps with smoothing out large,
       lumpy client requests.

   Language bindings
       Add "nbdkit.parse_size()" binding for Python (Nikolaus Rath).

       Compatibility with OCaml 4.14.

       Compatibility with Perl 5.36.

   Server
       kTLS should now work (transparently) when available in the kernel and
       GnuTLS.  Use of kTLS will be indicated in debug output.  (Daiki Ueno,
       František Krenželok)

   Bug fixes
       nbdkit-sh-plugin(3) now handles inline scripts correctly on non-glibc
       platforms (Martin Kletzander).

       Catch the case where nbdkit ends up linked to OpenSSL (because of a
       transient dependency through GnuTLS) which broke nbdkit-vddk-plugin(1).
       For more details see https://bugzilla.redhat.com/2057490.

       Fix memory leak in nbdkit-python-plugin(3) which would lead to large
       amounts of memory being leaked if your plugin implemented
       "list_exports" or "extents" callbacks (Eric Blake).

       The nbdkit-curl-plugin(1) cookie/header scripts feature now generates
       an error properly if the shell script fails.

       Fix further "phone home" messages in nbdkit-vddk-plugin(1) (thanks Ming
       Xie).

       Improve error message from nbdkit-vddk-plugin(1) when the thumbprint
       parameter is wrong (Laszlo Ersek).

       Fix "NBDKIT_CACHE_EMULATE" and "NBDKIT_ZERO_EMULATE" in filters.  These
       could cause assertion failures before.  (Eric Blake)

       Fix nbdkit-protect-filter(1) test if dependencies are missing (thanks
       Jim Fehlig).

       Fix a bounds error in nbdkit-checkwrite-filter(1).

       The server will now fail and exit early if the --tls-verify-peer option
       is used on platforms which do not support it.  Previously it would only
       fail when a client connected using TLS.

       Various bugs found by Coverity were analysed and fixed (Eric Blake).

   Documentation
       Document how to write plugins and filters in C++.  This has always been
       possible, but was never documented before.

       Document how to run nbdkit from inetd or xinetd superservers.

       Fix how verbatim paragraphs in the documentation are rendered in HTML.

       Document how to use nbdkit + TLS with nbd-client(1).

   Tests
       Various enhancements to fuzzing including supporting AFL++, AFL++
       clang-LTO.  Add "./configure --disable-linker-script" which is needed
       to use ASAN, and document how to use ASAN when fuzzing.

       Improve runtime of linuxdisk test (Eric Blake).

       Add interoperability tests with nbd-client(1), the Linux kernel client,
       including TLS support.

   Build
       Add GitLab continuous integration (CI) at
       https://gitlab.com/nbdkit/nbdkit/-/pipelines and many miscellaneous
       build fixes (Martin Kletzander).

       There are now "string_vector" and "const_string_vector" defined under
       common/utils and used consistently throughout the code.

       Microsoft Visual Studio Code formatting settings are available (in
       .vscode/) (Nikolaus Rath).

       Remove scripts/vddk-open.sh.  It is now available as a separate
       project: https://gitlab.com/nbdkit/vddk-remote

       "ARRAY_SIZE" macro added to simplify static array sizing (thanks Laszlo
       Ersek).

SEE ALSO
       nbdkit(1).

AUTHORS
       Authors of nbdkit 1.32:

       Alan Somers
       Eric Blake
       Laszlo Ersek
       Martin Kletzander
       Nikolaus Rath
       Richard W.M. Jones

COPYRIGHT
       Copyright (C) 2013-2022 Red Hat Inc.

LICENSE
       Redistribution and use in source and binary forms, with or without
       modification, are permitted provided that the following conditions are
       met:

       •   Redistributions of source code must retain the above copyright
           notice, this list of conditions and the following disclaimer.

       •   Redistributions in binary form must reproduce the above copyright
           notice, this list of conditions and the following disclaimer in the
           documentation and/or other materials provided with the
           distribution.

       •   Neither the name of Red Hat nor the names of its contributors may
           be used to endorse or promote products derived from this software
           without specific prior written permission.

       THIS SOFTWARE IS PROVIDED BY RED HAT AND CONTRIBUTORS ''AS IS'' AND ANY
       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
       IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
       PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL RED HAT OR CONTRIBUTORS BE
       LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
       CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
       SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
       BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
       WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
       OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
       ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------

       libnbd-release-notes-1.14 - release notes for libnbd 1.14

DESCRIPTION
       These are the release notes for libnbd stable release 1.14.  This
       describes the major changes since 1.12.

       libnbd 1.14.0 was released on 1 August 2022.

   Security
       No security issues were found in this release.

       If you find a security issue, please read SECURITY in the source
       (online here: https://gitlab.com/nbdkit/libnbd/blob/master/SECURITY).
       To find out about previous security issues in libnbd, see
       libnbd-security(3).

   New APIs
       No new APIs were added in this release.

   Enhancements to existing APIs
       Optimizations to nbd_pread_structured(3) (Eric Blake).

       Many performance enhancements in the Python bindings: "nbd.pread" now
       avoids an extra memory allocation and copy.  Buffers can now be passed
       to "nbd.Buffer.from_bytearray".  New methods
       "nbd.Buffer.{to,from}_buffer" allow control over copying and sharing
       "nbd.Buffer".  Any buffer-like object can be used in
       "nbd.aio_{pread,pwrite}".  "len(nbd.Buffer(n))" now works.  Improve
       error messages when the wrong types are passed to several APIs.  Fix
       usage of "PyGILState".  (Eric Blake)

       Golang "AioBuffer" now calls panic on invalid usage (Nir Soffer).

       In golang tests, use "GOTRACEBACK=crash" so we get full core dumps on
       failures.

       kTLS should now work (transparently) when available in the kernel and
       GnuTLS.  Use of kTLS will be indicated in debug output.  (Daiki Ueno,
       František Krenželok)

   Tools
       New nbddump(1) tool which can efficiently hexdump the contents of an
       NBD server.

       nbdcopy(1) now obeys the NBD server minimum/preferred block size when
       copying, which should make it more efficient and avoids issues with
       some qemu-nbd configurations where the minimum block size must be
       obeyed for correct operation.

   Tests
       New tests for "nbd+vsock://" URI support.

   Other improvements and bug fixes
       Fixed rare TLS deadlock when reading from slow servers, and support for
       clean shutdown when connecting to qemu-nbd over TLS (thanks Michael
       Ablassmeier).

       The library now uses the GnuTLS flag "GNUTLS_NO_SIGNAL" (if available)
       which ensures that TLS connections should not cause the main program to
       exit with "SIGPIPE" in certain cases of server failure.  (Libnbd has
       long used "MSG_NOSIGNAL" on non-TLS connections which has a similar
       effect.)

       Various enhancements to fuzzing were made, including support for AFL++
       clang-LTO mode, ASAN, allowing seed test cases to be captured, and
       extended testing of APIs.

       Tests were fixed so they should pass on RHEL 7 and FreeBSD.

   Documentation
       No changes in this release.

   Build
       "ARRAY_SIZE" macro added to simplify static array sizing (thanks Laszlo
       Ersek).

       Various errors found by Coverity were fixed.

SEE ALSO
       libnbd(3).

AUTHORS
       Eric Blake
       Nir Soffer
       Richard W.M. Jones

COPYRIGHT
       Copyright (C) 2019-2022 Red Hat Inc.

LICENSE
       This library is free software; you can redistribute it and/or modify it
       under the terms of the GNU Lesser General Public License as published
       by the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       This library is distributed in the hope that it will be useful, but
       WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       Lesser General Public License for more details.

       You should have received a copy of the GNU Lesser General Public
       License along with this library; if not, write to the Free Software
       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA




-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

