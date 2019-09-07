Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A58AC5ED
	for <lists+nbd@lfdr.de>; Sat,  7 Sep 2019 11:37:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E31352035A; Sat,  7 Sep 2019 09:37:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  7 09:37:39 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A238420216
	for <lists-other-nbd@bendel.debian.org>; Sat,  7 Sep 2019 09:37:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gBIyP-GegH5l for <lists-other-nbd@bendel.debian.org>;
	Sat,  7 Sep 2019 09:37:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5649D201D7
	for <nbd@other.debian.org>; Sat,  7 Sep 2019 09:37:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E00883082E10;
	Sat,  7 Sep 2019 09:37:24 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC465D9CD;
	Sat,  7 Sep 2019 09:37:24 +0000 (UTC)
Date: Sat, 7 Sep 2019 10:37:23 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Taylor Yang <taylor4869@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Question about IO workload via NBD
Message-ID: <20190907093723.GA3888@redhat.com>
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
 <20190902214851.GA25667@redhat.com>
 <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
 <CAKiK_mD-enqgQkoZ7omy1XY5N-mu=M2=CNm=STSa6VS1ue_cFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKiK_mD-enqgQkoZ7omy1XY5N-mu=M2=CNm=STSa6VS1ue_cFQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Sat, 07 Sep 2019 09:37:24 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <g0tAiMmpWFL.A.JPH.jp3cdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/684
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190907093723.GA3888@redhat.com
Resent-Date: Sat,  7 Sep 2019 09:37:39 +0000 (UTC)

On Fri, Sep 06, 2019 at 04:35:11PM -0700, Taylor Yang wrote:
> Hi All,
> 
> After specifying sync and flush error correctly, this issue seems to
> be fixed. But we still encounter IO error with FIO running on NBD that
> seems to cause by disconnection
> 
> The error is like
> fio: io_u error on file /dev/nbd0: Input/output error: write
> offset=xxxx, buflen=xxxx
> 
> I already specified 'persist' option while launching the nbd-client.
> Is there any other things I could do on the NBD side or the FIO side
> to prevent this error?
> 
> Any help is appreciated.

You might want to try out the NBD engine that we recently added to
FIO.  It's basically replacing one client (the kernel) with another
client (libnbd).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

