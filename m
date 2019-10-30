Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A9509E9847
	for <lists+nbd@lfdr.de>; Wed, 30 Oct 2019 09:40:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75647207F6; Wed, 30 Oct 2019 08:40:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 30 08:40:30 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1583520685
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Oct 2019 08:40:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iF-h9qdBuqAS for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Oct 2019 08:40:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6C0C22054B
	for <nbd@other.debian.org>; Wed, 30 Oct 2019 08:40:18 +0000 (UTC)
Received: from [105.12.0.33] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1iPjWW-0005Cf-Be; Wed, 30 Oct 2019 09:40:12 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92.3)
	(envelope-from <w@uter.be>)
	id 1iPjWH-0006qB-RE; Wed, 30 Oct 2019 10:39:57 +0200
Date: Wed, 30 Oct 2019 10:39:57 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Mike Christie <mchristi@redhat.com>,
	syzbot <syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com>,
	axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: INFO: task hung in nbd_ioctl
Message-ID: <20191030083957.GD25097@grep.be>
References: <000000000000b1b1ee0593cce78f@google.com>
 <5D93C2DD.10103@redhat.com>
 <20191017140330.GB25667@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017140330.GB25667@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9lQHXU5zFwI.A.SSE.-xUudB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/724
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191030083957.GD25097@grep.be
Resent-Date: Wed, 30 Oct 2019 08:40:30 +0000 (UTC)

On Thu, Oct 17, 2019 at 03:03:30PM +0100, Richard W.M. Jones wrote:
> On Tue, Oct 01, 2019 at 04:19:25PM -0500, Mike Christie wrote:
> > Hey Josef and nbd list,
> > 
> > I had a question about if there are any socket family restrictions for nbd?
> 
> In normal circumstances, in userspace, the NBD protocol would only be
> used over AF_UNIX or AF_INET/AF_INET6.

Note that someone once also did work to make it work over SCTP. I
incorporated the patch into nbd-client and nbd-server, but never
actually tested it myself. I have no way of knowing if it even still
works anymore...

[...]
-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

