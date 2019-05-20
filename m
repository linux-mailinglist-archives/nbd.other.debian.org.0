Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688E23025
	for <lists+nbd@lfdr.de>; Mon, 20 May 2019 11:21:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E8557203EE; Mon, 20 May 2019 09:21:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 20 09:21:19 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A3A3B203EC
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 May 2019 09:21:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2px8l8_txUmY for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 May 2019 09:21:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4FF9C203EB
	for <nbd@other.debian.org>; Mon, 20 May 2019 09:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A7EC80F6D;
	Mon, 20 May 2019 09:20:59 +0000 (UTC)
Received: from localhost (ovpn-116-243.ams2.redhat.com [10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83F1D1001F5B;
	Mon, 20 May 2019 09:20:57 +0000 (UTC)
Date: Mon, 20 May 2019 10:20:56 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: nbd@other.debian.org, berrange@redhat.com, eblake@redhat.com, w@uter.be
Subject: Standard NBD URL syntax (again)
Message-ID: <20190520092056.GA9368@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 20 May 2019 09:20:59 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TThn7wtJB8J.A.hgH.PGn4cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/499
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190520092056.GA9368@redhat.com
Resent-Date: Mon, 20 May 2019 09:21:19 +0000 (UTC)


Previous discussion:
https://lists.debian.org/nbd/2018/07/msg00002.html

Again I'm stuck because we need a URL syntax for NBD.

Various URLs have been proposed before:

  * Library      Hostname+port over TCP/IP
                 Unix domain socket
		 Export name
  - Link for further information
  - Notes

  * libguestfs   nbd://example.com:port      (:port is optional)
                 nbd://?socket=/socket
		 nbd://example.com:port/exportname
                 nbd:///exportname?socket=/socket
  - http://libguestfs.org/guestfish.1.html#a-nbd:-example.com-:port
  - Cannot specify an export name without a leading '/' character

  * QEMU         nbd:example.com:port
                 nbd:unix:/socket
		 nbd:example.com:port:exportname=/export
  - https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax
  - Not a real URL!

  * Curl         nbd://example.com/
                 nbd://example.com/exportname
  - https://github.com/rwmjones/curl/commit/2aba3dd7d8f9b8e03a8c3435e7555ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75
  - Cannot specify an export name without a leading '/' character
  - No Unix domain socket syntax was ever defined.
  - Did not go upstream.

The leading problem with the "obvious" NBD URL format seems to be that
it's impossible to specify empty export names or export names which
don't start with a '/' character.

This is why I'd be inclined to use an extra URL parameter instead,
like:

  nbd://example.com[:port]/?export=exportname

and for Unix domain sockets:

  nbd:///?export=exportname&socket=/socket

The export would be optional, defaulting to empty string.  IPv6
addresses would work in the obvious way for URLs, using "[...]"
around the address part (ie as in RFC 2732).  All escaping issues
would work as for standard URLs.

I think we should standardize this once and for all in a document in
the NBD repository.

Anyway let me know what you think and I will try to write something
formal.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

