Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C578F012
	for <lists+nbd@lfdr.de>; Thu, 15 Aug 2019 18:05:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E17DA2062D; Thu, 15 Aug 2019 16:05:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 15 16:05:53 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 889B920611
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Aug 2019 16:05:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dBygfNdO6BWv for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Aug 2019 16:05:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D972D205DE
	for <nbd@other.debian.org>; Thu, 15 Aug 2019 16:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 790F3EB9C4;
	Thu, 15 Aug 2019 16:05:34 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF4E1EA;
	Thu, 15 Aug 2019 16:05:29 +0000 (UTC)
Date: Thu, 15 Aug 2019 17:05:28 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: virt-tools-list@redhat.com, nbd@other.debian.org, libguestfs@redhat.com
Subject: ANNOUNCE: libnbd 0.9.8 - prerelease of high performance NBD client
 library
Message-ID: <20190815160528.GA31491@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 16:05:34 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wXgrxj65hUM.A.GcF.hLYVdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/621
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190815160528.GA31491@redhat.com
Resent-Date: Thu, 15 Aug 2019 16:05:53 +0000 (UTC)

I'm pleased to announce a new high performance Network Block Device
(NBD) client library called libnbd.  It's written in C and there are
also bindings available for Python, OCaml and (soon) Rust.

0.9.8 is the third pre-release before the stable 1.0 version where we
freeze the API, so feedback on API-related issues is very welcome now.

Download:       http://download.libguestfs.org/libnbd/
Documentation:  https://github.com/libguestfs/libnbd/blob/master/docs/libnbd.pod
Fedora package: https://koji.fedoraproject.org/koji/packageinfo?packageID=28807
Debian package: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=933223
Git repo:       https://github.com/libguestfs/libnbd
Mailing list:   libguestfs@redhat.com (no subscription required)

Here are some of the things you can do with this library ...

Connect to an NBD server and grab the first sector of the disk:
https://github.com/libguestfs/libnbd/blob/a5f8fd2f0f48e9cf2487e23750b55f67b166014f/examples/simple-fetch-first-sector.c#L14

High performance multi-threaded reads and writes, with multiple
connections and multiple commands in flight on each connection:
https://github.com/libguestfs/libnbd/blob/master/examples/threaded-reads-and-writes.c

Integrate with glib main loop:
https://github.com/libguestfs/libnbd/blob/master/examples/glib-main-loop.c

Connect to an NBD server from an interactive shell:

  $ nbdkit -f linuxdisk . &
  $ nbdsh --connect nbd://localhost

  Welcome to nbdsh, the shell for interacting with
  Network Block Device (NBD) servers.

  nbd> h.get_size()
  716266496
  nbd> buf = h.pread (512, 0)
  nbd> print ("%r" % buf)
  [prints the first sector]

Use ‘fio’ to benchmark an NBD server:

  $ nbdkit -U - memory size=256M \
        --run 'export unixsocket ; fio examples/nbd.fio '

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

