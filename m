Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2940ACA6
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 13:42:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD7922047D; Tue, 14 Sep 2021 11:42:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 11:42:52 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 05DFE2046C
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 11:42:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RohpYinbO1iB for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 11:42:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F5912046B
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OyulxNPZRJQgaxJ96lzfK3AcGP7GDS0fymvFsAXQtFY=; b=pUqwFGX7BXtZE0/dUsE09428Y/
	gKHcYX0z89Hh1muNfQlGW6+2HKw61W8NtlUMh1SW3Gp1CZ3AfUoYI9eprCp1N6zWjIQAkBsXi3PdF
	g0+s5/EANhnD3A6fZrbfZBq2hV6oZvIn+sReHR3D+MuBI7CgtvAhkbhyzR4x6YGU4umIK8HvDcExh
	kwFNjJmzfAqVdnk4C72xmqB7MwhUAVIutqCnboejoIpP8YDhT5HpgFaZpFMyXwFXEc8bgnXu0/YoR
	zLZcKuPnajBi62nPh6qi4PeVHSjWN9CJz3c4F6rMDGZqDaS8N1whKLVGUgvTE2EMIoT2zeTw8WIn/
	2mkZJiqQ==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mQ6pa-00HJIn-Vx; Tue, 14 Sep 2021 13:42:30 +0200
Received: from wouter by pc181009 with local (Exim 4.95-RC2)
	(envelope-from <w@uter.be>)
	id 1mQ6pX-0005AP-Lg;
	Tue, 14 Sep 2021 13:42:27 +0200
Date: Tue, 14 Sep 2021 13:42:27 +0200
From: Wouter Verhelst <w@uter.be>
To: Hou Tao <houtao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
Message-ID: <YUCKoySdM9WZlUH9@pc181009.grep.be>
References: <20210904122519.1963983-1-houtao1@huawei.com>
 <20210904122519.1963983-4-houtao1@huawei.com>
 <20210906093051.GC30790@lst.de>
 <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
 <20210906102521.GA3082@lst.de>
 <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com>
 <20210909064035.GA26290@lst.de>
 <6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SOUjNY4H7eC.A.NBG.8qIQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1459
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUCKoySdM9WZlUH9@pc181009.grep.be
Resent-Date: Tue, 14 Sep 2021 11:42:52 +0000 (UTC)

On Mon, Sep 13, 2021 at 12:32:37PM +0800, Hou Tao wrote:
> Hi Christoph,
> 
> On 9/9/2021 2:40 PM, Christoph Hellwig wrote:
> > On Tue, Sep 07, 2021 at 11:04:16AM +0800, Hou Tao wrote:
> >> Let me explain first. The reason it works is due to genl_lock_all() in netlink code.
> > Btw, please properly format your mail.  These overly long lines are really
> > hard to read.
> Thanks for reminding.
> >> If the module removal happens before calling try_module_get(), nbd_cleanup() will
> >>
> >> call genl_unregister_family() first, and then genl_lock_all(). genl_lock_all() will
> >>
> >> prevent ops in nbd_connect_genl_ops() from being called, because the calling
> >>
> >> of nbd ops happens in genl_rcv() which needs to acquire cb_lock first.
> > Good.
> >
> >> I have checked multiple genl_ops, it seems that the reason why these genl_ops
> >>
> >> don't need try_module_get() is that these ops don't create new object through
> >>
> >> genl_ops and just control it. However genl_family_rcv_msg_dumpit() will try to
> >>
> >> call try_module_get(), but according to the history (6dc878a8ca39 "netlink: add reference of module in netlink_dump_start"),
> >>
> >> it is because inet_diag_handler_cmd() will call __netlink_dump_start().
> > And now taking a step back:  Why do we even need this extra module
> > reference?  For the case where nbd_alloc_config is called from nbd_open
> > we obviously don't need it.  In the case where it is called from
> > nbd_genl_connect that prevents unloading nbd when there is a configured
> > but not actually nbd device.  Which isn't reallyed need and counter to
> > how other drivers work.
> Yes, the purpose of module ref-counting in nbd_alloc_config() is to force
> the user to disconnect the nbd device manually before module removal.
> And loop device works in the same way. If a file is attached to a loop device,
> an extra module reference will be taken in loop_configure() and the removal
> of loop module will fail. The only difference is that loop driver takes the
> extra ref-count by ioctl, and nbd does it through netlink.

Haven't checked the actual patch, but just wanted to point out:

nbd should do it through netlink *and* ioctl -- the older way to
configure nbd was through ioctl, which we should still support for
backcompat reasons.

(if that's already the case, then ignore what I said :-)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

