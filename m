Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B4AC6D6
	for <lists+nbd@lfdr.de>; Sat,  7 Sep 2019 15:47:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C96B1203D2; Sat,  7 Sep 2019 13:47:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  7 13:47:54 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 505C52042C
	for <lists-other-nbd@bendel.debian.org>; Sat,  7 Sep 2019 13:47:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qmobTXUimqwv for <lists-other-nbd@bendel.debian.org>;
	Sat,  7 Sep 2019 13:47:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B57BD20455
	for <nbd@other.debian.org>; Sat,  7 Sep 2019 13:47:07 +0000 (UTC)
Received: from [105.184.149.17] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1i6b3Q-0007rb-98; Sat, 07 Sep 2019 15:47:04 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92.1)
	(envelope-from <w@uter.be>)
	id 1i6b3E-0007HL-QK; Sat, 07 Sep 2019 15:46:52 +0200
Date: Sat, 7 Sep 2019 15:46:52 +0200
From: Wouter Verhelst <w@uter.be>
To: Taylor Yang <taylor4869@gmail.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Subject: Re: Question about IO workload via NBD
Message-ID: <20190907134652.GB26248@grep.be>
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
 <20190902214851.GA25667@redhat.com>
 <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jcmO9Vd5Hl.A.mN.KU7cdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/685
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190907134652.GB26248@grep.be
Resent-Date: Sat,  7 Sep 2019 13:47:54 +0000 (UTC)

On Tue, Sep 03, 2019 at 02:47:52PM -0700, Taylor Yang wrote:
> Hi Richard,
> 
> The command I use is like `fio --name=xxx --rw=randread --output=xxx
> --direct=1 --ioengine=libaio --bs=16k --iodepth=4 --filename=/dev/nbd0
> --size=1024Mb` and I setup both nbd client and nbd server on two
> different hosts. The FIO job is executed on the nbd client side after
> the connection between the nbd client and server being setup. I think
> it is because nbd server uses the buffer cache but I also tried to
> specify the `sync` option in the config file and it still behaves the
> same way.

Did you enable the flush and/or fua options?

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

