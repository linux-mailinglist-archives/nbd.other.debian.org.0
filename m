Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD9414D91
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 17:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 82B8120AC3; Wed, 22 Sep 2021 15:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 15:57:13 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 970BE20A2D
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 15:57:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3srPCbRGNH5p for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 15:57:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B0435206F7
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vX6Qu+emXOBeX55x21xlP5yK5xuZNhWOHbJG5PTxsow=; b=dXaiMB7WWoz7Zu09KijKcG32EI
	lhOXgJPMh3ProOjEwiW4/7buxU03QPvqXH40kT5kMxKFBQDHotzs10cUIJaE8AUBDiGff3jw17bkA
	uQRRJcUNymBuDycw8begbgGE3pYl9x0P6sfUBufEbuyKuRITWt1bng+7y0y4SmFY9jXdPnvwUCZbs
	a0J9KO1HWoqJhZOB6WQXmtZo/zE280weWx7kNi/36CP5QAPdonVU6IJ0gOTp1o2ZWL9j7sYZUeUAU
	W8ZSa4AhBEu5VQkPY8mgxuFcgB4r4Cjn3hXgrYJrpIChOhu+sB64WrzRyDtI2mylC5WotcPzIhYcN
	358GTTTQ==;
Received: from 197-101-72-171.ip.broadband.is ([197.101.72.171] helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mT4bu-00Cfvr-R2; Wed, 22 Sep 2021 17:56:38 +0200
Received: from wouter by pc181009 with local (Exim 4.95-RC2)
	(envelope-from <w@uter.be>)
	id 1mT4bg-0003l5-0I;
	Wed, 22 Sep 2021 17:56:24 +0200
Date: Wed, 22 Sep 2021 17:56:23 +0200
From: Wouter Verhelst <w@uter.be>
To: Ming Lei <ming.lei@redhat.com>
Cc: "yukuai (C)" <yukuai3@huawei.com>, josef@toxicpanda.com,
	axboe@kernel.dk, hch@infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [patch v8 3/7] nbd: check sock index in nbd_read_stat()
Message-ID: <YUtSJ/bfKZ9QJUaY@pc181009.grep.be>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <20210916093350.1410403-4-yukuai3@huawei.com>
 <7e2913ca-1089-9ab7-cfdb-5e8837d36034@huawei.com>
 <YUr1v8zylPOFFXTO@T590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUr1v8zylPOFFXTO@T590>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8KVDIq48FEB.A.GVB.ZJ1ShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1527
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUtSJ/bfKZ9QJUaY@pc181009.grep.be
Resent-Date: Wed, 22 Sep 2021 15:57:13 +0000 (UTC)

On Wed, Sep 22, 2021 at 05:22:07PM +0800, Ming Lei wrote:
> On Sun, Sep 19, 2021 at 06:34:28PM +0800, yukuai (C) wrote:
> > On 2021/09/16 17:33, Yu Kuai wrote:
> > > The sock that clent send request in nbd_send_cmd() and receive reply
> > > in nbd_read_stat() should be the same.
> > > 
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >   drivers/block/nbd.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > index 614c6ab2b8fe..c724a5bd7fa4 100644
> > > --- a/drivers/block/nbd.c
> > > +++ b/drivers/block/nbd.c
> > > @@ -746,6 +746,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> > >   		ret = -ENOENT;
> > >   		goto out;
> > >   	}
> > > +	if (cmd->index != index) {
> > > +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d from different sock %d (expected %d)",
> > > +			tag, index, cmd->index);
> > > +	}
> > >   	if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
> > >   		dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
> > >   			req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
> > > 
> > 
> > Hi, Ming
> > 
> > Any suggestions about this patch?
> 
> I think this one relies on nbd protocol between server and client, and
> does the protocol require both request and reply xmitted via same
> socket?

As Eric already answered: yes, the request and reply are specified such
that they must be transmitted over the same socket.

For more details, you can find the protocol specification at
https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md

Please note that the protocol defined there has some options that are
not currently supported by the Linux nbd implementation -- specifically
the "structured reply" message format (and all that requires it) is not
implemented (yet?).

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

