Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F1AA5DAA
	for <lists+nbd@lfdr.de>; Mon,  2 Sep 2019 23:49:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 762A720E17; Mon,  2 Sep 2019 21:49:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  2 21:49:05 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E30B202F6
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Sep 2019 21:48:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l0yhpcBg0vuS for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Sep 2019 21:48:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C9962202AF
	for <nbd@other.debian.org>; Mon,  2 Sep 2019 21:48:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98E2B307CDFC;
	Mon,  2 Sep 2019 21:48:52 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F74A60BF3;
	Mon,  2 Sep 2019 21:48:51 +0000 (UTC)
Date: Mon, 2 Sep 2019 22:48:51 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Taylor Yang <taylor4869@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Question about IO workload via NBD
Message-ID: <20190902214851.GA25667@redhat.com>
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 02 Sep 2019 21:48:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YCicQZiYpeH.A.TN.R5YbdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/676
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190902214851.GA25667@redhat.com
Resent-Date: Mon,  2 Sep 2019 21:49:05 +0000 (UTC)

On Fri, Aug 30, 2019 at 05:23:44PM -0700, Taylor Yang wrote:
> Hi,
> 
> I worked on driving IO workload using FIO to a device via NBD. There
> seems to be some delay on the IO being shown on the original device
> after the FIO workload completed on the NBD. Is there a delay on how
> long the IO would be acknowledged on the original device? Is there any
> logging information I could get to troubleshoot this issue?
> 
> Thank you so much for your help in advance.

What's the fio command line / configuration file?  Are you
using the NBD engine or a filesystem?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

