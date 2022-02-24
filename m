Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 815934C358E
	for <lists+nbd@lfdr.de>; Thu, 24 Feb 2022 20:16:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 632F42025F; Thu, 24 Feb 2022 19:16:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 24 19:16:32 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8BA6F20222
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Feb 2022 19:16:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.789 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WaUG0Aa2zvKc for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Feb 2022 19:16:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 425 seconds by postgrey-1.36 at bendel; Thu, 24 Feb 2022 19:16:16 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5EFF420203
	for <nbd@other.debian.org>; Thu, 24 Feb 2022 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645730170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NUFqGtnSb7FrdhPaAFnFwz8y2u18Vij4TLULRnsyMWw=;
	b=EUaDezPTWVYkxt8Gp2IRwWNtosCGQBl5DzNmd+CAenNYrd1WerJTOyhfTV04BO9qqBnD+b
	d7dzETL9rqC8WVF3jxsZhtZAMyEefrmxe/aR12y/sixxUXDWjXK5fo427UwuLfV2WLzz4E
	NXd3dc2WtU3tTu/tOCJTKWXK1R/7iDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-Cj6WodAXPyCqCBLb6H-DQA-1; Thu, 24 Feb 2022 14:09:00 -0500
X-MC-Unique: Cj6WodAXPyCqCBLb6H-DQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7EC61006AA5
	for <nbd@other.debian.org>; Thu, 24 Feb 2022 19:08:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 459C55F4E7;
	Thu, 24 Feb 2022 19:08:59 +0000 (UTC)
Date: Thu, 24 Feb 2022 19:08:58 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, nbd@other.debian.org
Subject: ANNOUNCE: nbdkit 1.30 and libnbd 1.12 released
Message-ID: <20220224190858.GT8021@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ndrYmzdpuZN.A.NhB.Qm9FiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1717
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220224190858.GT8021@redhat.com
Resent-Date: Thu, 24 Feb 2022 19:16:32 +0000 (UTC)

nbdkit is a Network Block Device (NBD) server with stable plugin ABI
and permissive license.  libnbd is an NBD client library.

I'm pleased to announce the latest stable releases of both projects:
nbdkit 1.30.0 and libnbd 1.12.0.  You can download both from the
download directories here:

https://download.libguestfs.org/nbdkit/
https://download.libguestfs.org/libnbd/

Release notes are online here and attached below:

https://libguestfs.org/nbdkit-release-notes-1.30.1.html
https://libguestfs.org/libnbd-release-notes-1.12.1.html

Rich.


          ------------------------------


       These are the release notes for nbdkit stable release 1.30.  This
       describes the major changes since 1.28.

       nbdkit 1.30.0 was released on 24 February 2022.

   Security
       There were no security issues found.  All past security issues and
       information about how to report new ones can be found in
       nbdkit-security(1).

   Plugins
       nbdkit-streaming-plugin has been removed.  It was deprecated in 1.26
       and scheduled for removal in this release.  If you were using this
       plugin, use nbdcopy(1) instead.

       nbdkit-vddk-plugin(1) has several changes:

       •   This plugin can now create (as well as reading and writing) local
           VMDK files.  See the new "create=true" option and the various
           "create-*" options.

       •   Read and write is now implemented using the VDDK Async functions,
           which improves performance.  The full nbdkit parallel thread model
           is supported.

       •   VDDK ≥ 6.5 (released Nov 2016) is now the minimum required version.

       •   Stats collected when using -D vddk.stats=1 have been extended to
           include number of calls and bytes transferred.

       •   --dump-plugin output now includes the VDDK major version and
           information about each VDDK API that is implemented by the library.

       •   A new example scripts/vddk-open.sh is provided to help with
           automating connections to remote ESXi virtual machines.

       nbdkit-curl-plugin(1) adds support for choosing TLS/SSL versions and
       ciphers and TLS 1.3 cipher versions (Przemyslaw Czarnowski).

       nbdkit-file-plugin(1) now implements "cache=none" for writes so that
       the Linux page cache is not destroyed when writing huge files.

       nbdkit-cc-plugin(1) now implements the ".cleanup" callback.  Also we
       document how to use this plugin to implement OCaml plugin scripts.

       nbdkit-info-plugin(1) --dump-plugin option now prints
       "info_address=yes" when the platform supports "mode=address".

   Filters
       New nbdkit-retry-request-filter(1), which is similar to
       nbdkit-retry-filter(1) but only retries a single failing request.

       New nbdkit-protect-filter(1) lets you add write-protection over regions
       of a plugin.

       New nbdkit-blocksize-policy-filter(1) lets you adjust or set the block
       size constraints and policy of underlying plugins.  See "API" below.

       nbdkit-cow-filter(1) now permits the COW block size to be set as small
       as 4096 bytes.

       Debug messages in nbdkit-error-filter(1) are now easier to read because
       they no longer all have an "error:" prefix (Eric Blake).

   Language bindings
       For plugins written in OCaml the minimum version of OCaml is now 4.03
       (instead of 4.02.2 previously).  Various source-level incompatible
       changes were made to OCaml plugins in this release.  Please consult the
       new documentation and example if writing plugins in OCaml.

       OCaml plugins now support "magic_config_key".

       Several fixes to the handling of integers in Python plugins (Nir
       Soffer).

       New Python example which simulates request errors (Nir Soffer).

   Server
       The server no longer requests the "AI_ADDRCONFIG" hint when opening a
       server socket.  This improves handling of IPv6.  In a related change,
       the -i (--ipaddr) option now works as intended, and new -4 and -6
       options have been added to restrict the listening socket to IPv4 or
       IPv6 addresses (Laszlo Ersek).

   API
       There is a new ".block_size" callback for plugins and filters.  nbdkit
       uses this to export block size constraints to clients, specifically the
       minimum, preferred and maximum block size that clients should use.

       As well as regular C plugins, nbdkit-cc-plugin(3),
       nbdkit-eval-plugin(1), nbdkit-ocaml-plugin(3), nbdkit-python-plugin(3)
       and nbdkit-sh-plugin(3) support block size constraints.
       nbdkit-nbd-plugin(1) reexports block size constraints from the proxied
       NBD server.  nbdkit-vddk-plugin(1) now advertises a minimum 512 byte
       block size.

       nbdkit-blocksize-filter(1), nbdkit-cache-filter(1),
       nbdkit-cow-filter(1) and nbdkit-swab-filter(1) adjust block size
       constraints from plugins (Eric Blake).

       nbdkit-blocksize-filter(1) can also use the block size hints from the
       plugin instead of needing manual adjustment on the command line.
       nbdkit-log-filter(1) logs block size constraints (Eric Blake).

       nbdkit-blocksize-policy-filter(1) can be used to add block size
       constraints to plugins which don't support it, or adjust constraints,
       or set the error policy.

   Bug fixes
       nbdkit-memory-plugin(1) (and others), using
       "allocator=malloc,mlock=true" was broken.  This was especially evident
       on non-Linux or on Linux with 64K pages (eg. POWER).  It should now
       work correctly.

   Tests
       "./configure --disable-libguestfs-tests" can now be used to disable
       tests which need libguestfs, without disabling
       nbdkit-guestfs-plugin(1).

       We now use mke2fs(8) instead of guestfish(1) to create the ext4 test
       image.  On armv7 this allows the test suite to run much more quickly.

       The time taken to run the test suite has been reduced significantly.

   Build
       Multiple fixes to the Windows (MinGW) build.  The test suite should now
       pass fully if you have the version of Wine with the unofficial
       "AF_UNIX" patch.

       The top level bash source directory has been renamed to bash-
       completion.  This prevents problems when setting $PATH to the source
       directory and trying to run bash.

   Internals
       The performance of the internal vector library has been improved
       greatly and overflow is now handled correctly (Nir Soffer, Laszlo Ersek
       and Eric Blake).

       New "nbdkit-string.h" header file which defines a common string type
       (based on vector).  Existing places which defined a string based on
       vector have been updated to use it.

       "MIN" and "MAX" macros can be nested (thanks Eric Blake).

SEE ALSO
       nbdkit(1).

AUTHORS
       Authors of nbdkit 1.30:

       Alan Somers
       Eric Blake
       Hilko Bengen
       Laszlo Ersek
       Nir Soffer
       Przemyslaw Czarnowski
       Richard W.M. Jones


          ------------------------------


       These are the release notes for libnbd stable release 1.12.  This
       describes the major changes since 1.10.

       libnbd 1.12.0 was released on 24 February 2022.

   Security
       CVE-2022-0485
           Silent data corruption when using nbdcopy(1).

           See the full announcement here:
           https://listman.redhat.com/archives/libguestfs/2022-February/msg00104.html

       If you find a security issue, please read SECURITY in the source
       (online here: https://gitlab.com/nbdkit/libnbd/blob/master/SECURITY).
       To find out about previous security issues in libnbd, see
       libnbd-security(3).

   New APIs
       get_pread_initialize
       set_pread_initialize
           Control whether libnbd clears the pread buffer to avoid leaking
           memory contents if the client does not properly handle errors.
           These were added as part of the fix for CVE-2022-0485 (Eric Blake).

       get_request_block_size
       set_request_block_size
           Control whether libnbd requests block size constraints from the
           server during negotiation (Eric Blake).

   Enhancements to existing APIs
       Error messages about incorrect URIs in nbd_connect_uri(3) have been
       improved to make common mistakes clearer for the user.

   Tools
       New syntax: "nbdinfo [ CMD ... ]" allowing you to query the properties
       of an NBD server directly.

       nbdcopy(1) new --queue-size option to control the maximum size of the
       internal buffer.

       nbdcopy(1) now names the source and destination handles to make it
       easier to understand debug output.

   Tests
       Adopt libvirt-ci's ci/gitlab.yml (Martin Kletzander).

       Fix the OCaml extents example (thanks Laszlo Ersek).

       Golang benchmarks were added to the test suite (Nir Soffer).

       The large tests/errors.c test was split into about a dozen separate
       tests.  Also this adds a new test for checking server-side block size
       constraint error policy which was missing before.

   Other improvements and bug fixes
       New OCaml "NBD.with_handle" helper which ensures that "NBD.close" is
       always called even if the inner code throws an exception.

       The OCaml bindings now consistently use the correct types for buffer
       sizes everywhere (Laszlo Ersek).

       Several improvements and fixes to the golang bindings and tests.  The
       golang bindings have been relicensed to LGPLv2+ like the rest of the
       library and are now published as a golang module at
       https://libguestfs.org/libnbd (Nir Soffer).

       The Python bindings no longer crash if you pass "None" in place of a
       buffer parameter.  In addition some memory leaks were fixed (Eric
       Blake).

       Various memory leaks have been fixed when using the optional
       strict_mode settings (Eric Blake).

       The performance of the internal vector library has been improved
       greatly and overflow is now handled correctly (Nir Soffer, Laszlo Ersek
       and Eric Blake).

       Add "simple_copy" and "aio_copy" Golang examples (Nir Soffer).

       Error handling was reviewed and fixed across many of the example
       programs and documentation (Eric Blake, Nir Soffer).

       Simplify and optimize handling of the extents callback in Golang (Nir
       Soffer).

       Golang AioBuffer was enhanced, making it safer to use, faster and
       adding documentation (Nir Soffer).

   Documentation
       Document the limits on lengths and sizes of parameters to various APIs
       (Eric Blake).

   Build
       You can now build programs that use the OCaml bindings of libnbd
       against the libnbd build directory instead of requiring libnbd to be
       installed (Laszlo Ersek).

       Compatibility with OCaml 4.13.

       Line locations in the state machine should be more accurate when
       stepping through with a debugger like gdb.

       .editorconfig file can be used to help code formatting, see
       https://editorconfig.org/ (Nir Soffer, Eric Blake).

       "MIN" and "MAX" macros can be nested (thanks Eric Blake).

SEE ALSO
       libnbd(3).

AUTHORS
       Eric Blake
       Laszlo Ersek
       Martin Kletzander
       Nir Soffer
       Richard W.M. Jones



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

