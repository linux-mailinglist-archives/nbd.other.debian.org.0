Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9E2522AE
	for <lists+nbd@lfdr.de>; Tue, 25 Aug 2020 23:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B23C202EB; Tue, 25 Aug 2020 21:22:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 25 21:22:20 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9B63B2029D
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Aug 2020 21:22:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.102 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id B88q1K9KDtpG for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Aug 2020 21:22:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id BF5322029B
	for <nbd@other.debian.org>; Tue, 25 Aug 2020 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598390521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XuT42yOkfdA+wMaxyw5KDqINVZj8rLGxPLEtzLmXKdM=;
	b=WTbKLFnbWYZz//FiO+tQu4U/xw4Bp48q3R8TLuNS7+5A7vaGb0LSRI/ABAyBw2ycvU67D7
	V3AJgWzyWeQovLmhm4TaBfQEe00E3zeIjgNGVgg11GzVXVFpqyxAIESYk0PeLzMKmeOcjG
	NFOlcoQj5d/YtREhfyHkkcFxzomdZ/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-fbUw_D34Mq28azx5ixV2gg-1; Tue, 25 Aug 2020 17:20:47 -0400
X-MC-Unique: fbUw_D34Mq28azx5ixV2gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CA7881F01D;
	Tue, 25 Aug 2020 21:20:46 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E125074E00;
	Tue, 25 Aug 2020 21:20:40 +0000 (UTC)
Date: Tue, 25 Aug 2020 22:20:39 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: libguestfs@redhat.com, virt-tools-list@redhat.com, nbd@other.debian.org,
	qemu-devel@nongnu.org
Subject: ANNOUNCE: libnbd 1.4 - high performance NBD client library
Message-ID: <20200825212039.GR16477@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b5PzJz0TmFL.A.jT.MEYRfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/955
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200825212039.GR16477@redhat.com
Resent-Date: Tue, 25 Aug 2020 21:22:20 +0000 (UTC)

I'm pleased to announce the release of libnbd 1.4.0,
a high performance Network Block Device (NBD) client library.


Key features of libnbd:

 * Synchronous API for ease of use.

 * Asynchronous API for writing non-blocking, multithreaded clients.
   You can mix both APIs freely.

 * High performance.

 * Minimal dependencies for the basic library.

 * Well-documented, stable API.

 * Bindings in several programming languages.

 * Shell (nbdsh) for command line and scripting.


Git:      https://github.com/libguestfs/libnbd
Download: https://download.libguestfs.org/libnbd/1.4-stable/
Release notes:
          https://libguestfs.org/libnbd-release-notes-1.4.1.html

Fedora:   https://koji.fedoraproject.org/koji/packageinfo?packageID=28807
Debian:   https://packages.debian.org/libnbd


*** Release notes for libnbd 1.4 ***

       These are the release notes for libnbd stable release 1.4.  This
       describes the major changes since 1.2.

       libnbd 1.4.0 was released on 25 August 2020.

   Security
       There were no security issues found in this release.  If you find a
       security issue, please read SECURITY in the source (online here:
       https://github.com/libguestfs/libnbd/blob/master/SECURITY).  To find
       out about previous security issues in libnbd, see libnbd-security(3).

   New APIs
       nbd_set_opt_mode(3)
       nbd_get_opt_mode(3)
       nbd_aio_is_negotiating(3)
           libnbd 1.4 adds a new “negotiating” state during NBD handshaking.
           For backwards compatibility programs must request this before
           starting the connection by calling nbd_set_opt_mode(3).  You can
           find out if the connection is in this state by calling
           nbd_aio_is_negotiating(3).

           For an in-depth description of how this extra state can be used to
           negotiate server options, see "CONTROLLING NEGOTIATION" in
           libnbd(3).

       nbd_aio_opt_abort(3)
       nbd_opt_abort(3)
           During the negotiating state, abort the connection.

       nbd_aio_opt_go(3)
       nbd_opt_go(3)
           During the negotiating state, complete the handshake.

       nbd_aio_opt_info(3)
       nbd_opt_info(3)
           During the negotiating state, request full information about the
           server export.

       nbd_aio_opt_list(3)
       nbd_opt_list(3)
           During the negotiating state, request the list of exports that the
           server provides.

       nbd_get_block_size(3)
           Return the minimum, preferred or maximum block size constraints for
           requests sent to the server.

       nbd_get_canonical_export_name(3)
           Return the canonical export name that the server defaults to.  This
           information may only be available if you call nbd_set_full_info(3)
           before connecting.

       nbd_get_export_description(3)
           Return the optional text description of the current export.  This
           information may only be available if you call nbd_set_full_info(3)
           before connecting.

       nbd_set_full_info(3)
       nbd_get_full_info(3)
           Enable extended information about exports from the server.

       Thanks: Eric Blake for all of the new APIs.

   New features
       Bindings are now available in the Go programming language.

       FreeBSD and OpenBSD are now fully supported platforms.

       Bash tab completion is available for all of the command line tools.

   Documentation
       Verbatim text in man pages that wrapped over several lines is now
       typeset correctly.

       Links within the documentation have been enhanced, and are now checked
       for correctness.

   Tools
       New nbdcopy(1) tool lets you copy between an NBD server and a local
       file, or stream to and from an NBD server.

       New nbdinfo(1) tool lets you print extended information about an NBD
       server’s exports (Eric Blake).

   Tests
       Test sockets are created in /tmp (instead of the local directory).
       This stops the test suite from failing if the local directory path is
       longer than the Unix domain socket maximum path length.

   Other improvements and bug fixes
       Trace messages have been improved: long strings are truncated, strings
       with non-printable characters are escaped, and lists of strings are
       printed.

       The generator was split from a large single script into several small
       files.  To build from git the OCaml bytecode compiler (ocamlc(1)) is
       now required instead of the interpreter (ocaml(1)).

       Long login names are supported in nbd_get_tls_username(3).

       The handle name in nbdsh(1) is now set to "nbdsh" (instead of a
       randomly generated name).

       Compatibility with OCaml 4.10.0 and 4.11.0.

       Python AIO buffer adds a new "is_zero" method allowing Python clients
       to do sparsification when copying.

       Compatibility with Python 3.9.

       External C programs can now be compiled against libnbd’s build
       directory using "../libnbd/run ./configure".

       Honggfuzz can be used as another external fuzzing option.

       Fix compilation with glibc 2.32 which deprecates "sys_errlist".

       Many examples added or extended to demonstrate uses of the new APIs
       (Eric Blake).

SEE ALSO
       libnbd(3).

AUTHORS
       Eric Blake

       Richard W.M. Jones




-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

