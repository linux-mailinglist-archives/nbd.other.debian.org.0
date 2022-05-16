Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F36AC52843A
	for <lists+nbd@lfdr.de>; Mon, 16 May 2022 14:33:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DA5DC203F6; Mon, 16 May 2022 12:33:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 16 12:33:16 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B8A2A203D0
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 May 2022 12:18:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4pxESxa7BV-U for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 May 2022 12:17:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x833.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7A96120351
	for <nbd@other.debian.org>; Mon, 16 May 2022 12:17:58 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id s22so6175805qta.0
        for <nbd@other.debian.org>; Mon, 16 May 2022 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6WoWussqs/nE0WQFdCOfcolnwp+yEL3nnakgRyZRHVE=;
        b=dNPrnAOHFoYC1Szl537Ai+cBSuuvzo2sTNk+SMetEJzZpdGUqXGFGgUSqKF5vBUjYm
         gMwOGHC24+4HHAibvvjAofcotuJ36Rac28QKstG6THDLsWqpUIzPO7pFtceJPS2bueKl
         k6Q6FW3PpcgUCsCghBOONcWHLu0+iLgzdH68yD6hOCOCzmJoTVpUU82s70otH7dJRi70
         CvCx2eMkWmxccQUs7E0erTwIIsfKLvELEoEUxLBCQqyZrq9M9U/bAL/9H9t/px39opul
         Yvr+ep+zr9xXjHghZx2ZPyP+bdFM1UDY/fE14VXGXL6w8ZCVS+e68RZVteHzg1sPewih
         S/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6WoWussqs/nE0WQFdCOfcolnwp+yEL3nnakgRyZRHVE=;
        b=nLdLwKLoGFRsWVPMpJnTTJyihhFvqiwiTBlH7G9pdRLgrovFdETZouNBy5xAqqhiAI
         oHLV4yG+VHOE8WNOrxcHveiCT0QHb03otYu7cHpqNbhCi1cGjxVtoRPywgFxt8CfrrrB
         +iWTZcwJwRzNtGnWQE4YivfH1L4wJWQ7uJKtnnzX35Ou26Oy7pequXCDqigmOKN5gyhu
         mdpYHOAcfslSRHGH09+eRb73VGN1BVSBsIsOEB1ns8ntTNoc6IswEo3OdHZAQm0QYlHH
         jmFTNfbwT5JlOpiefwTcSGg0qo+WcO58no+tnG6TgJzJv5Yu7E9d7ImRkVXVcvmEaeca
         im4Q==
X-Gm-Message-State: AOAM532RXHUw39pvOlWzG0jh2dZWRdcgELx7r5EZZFGt0vWkO99VHH1k
	SK50OxYipWRSEnQHRb5in8d3kw==
X-Google-Smtp-Source: ABdhPJzqEm7QHW/ub0pHz6AYCmev82zktUJyJxo3YCahnMnuMg5LtLrY7OUuAcE3jTIC8fdqjXBpvg==
X-Received: by 2002:ac8:584a:0:b0:2f7:b19b:f9b6 with SMTP id h10-20020ac8584a000000b002f7b19bf9b6mr6722119qth.683.1652703474556;
        Mon, 16 May 2022 05:17:54 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id a128-20020ae9e886000000b006a2e2dde144sm2751831qkg.88.2022.05.16.05.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:17:53 -0700 (PDT)
Date: Mon, 16 May 2022 08:17:52 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: Matthew Ruffell <matthew.ruffell@canonical.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
Message-ID: <YoJA8C2XtXY27qJ1@localhost.localdomain>
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
 <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
 <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
 <Yn5Zf6lONff1AoOA@localhost.localdomain>
 <6efae367-12fa-1a58-7438-1b39dc0d6ef8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6efae367-12fa-1a58-7438-1b39dc0d6ef8@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T2h4ssUkGgC.A.BQ.MSkgiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2073
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YoJA8C2XtXY27qJ1@localhost.localdomain
Resent-Date: Mon, 16 May 2022 12:33:16 +0000 (UTC)

On Sat, May 14, 2022 at 11:39:25AM +0800, yukuai (C) wrote:
> 在 2022/05/13 21:13, Josef Bacik 写道:
> > On Fri, May 13, 2022 at 02:56:18PM +1200, Matthew Ruffell wrote:
> > > Hi Josef,
> > > 
> > > Just a friendly ping, I am more than happy to test a patch, if you send it
> > > inline in the email, since the pastebin you used expired after 1 day, and I
> > > couldn't access it.
> > > 
> > > I came across and tested Yu Kuai's patches [1][2] which are for the same issue,
> > > and they indeed fix the hang. Thank you Yu.
> > > 
> > > [1] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
> > > https://lists.debian.org/nbd/2022/04/msg00212.html
> > > 
> > > [2] nbd: fix io hung while disconnecting device
> > > https://lists.debian.org/nbd/2022/04/msg00207.html
> > > 
> > > I am also happy to test any patches to fix the I/O errors.
> > > 
> > 
> > Sorry, you caught me on vacation before and I forgot to reply.  Here's part one
> > of the patch I wanted you to try which fixes the io hung part.  Thanks,
> > 
> > Josef
> > 
> > > From 0a6123520380cb84de8ccefcccc5f112bce5efb6 Mon Sep 17 00:00:00 2001
> > Message-Id: <0a6123520380cb84de8ccefcccc5f112bce5efb6.1652447517.git.josef@toxicpanda.com>
> > From: Josef Bacik <josef@toxicpanda.com>
> > Date: Sat, 23 Apr 2022 23:51:23 -0400
> > Subject: [PATCH] timeout thing
> > 
> > ---
> >   drivers/block/nbd.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 526389351784..ab365c0e9c04 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -1314,7 +1314,10 @@ static void nbd_config_put(struct nbd_device *nbd)
> >   		kfree(nbd->config);
> >   		nbd->config = NULL;
> > -		nbd->tag_set.timeout = 0;
> > +		/* Reset our timeout to something sane. */
> > +		nbd->tag_set.timeout = 30 * HZ;
> > +		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
> > +
> >   		nbd->disk->queue->limits.discard_granularity = 0;
> >   		nbd->disk->queue->limits.discard_alignment = 0;
> >   		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
> > 
> Hi, Josef
> 
> This seems to try to fix the same problem that I described here:
> 
> nbd: fix io hung while disconnecting device
> https://lists.debian.org/nbd/2022/04/msg00207.html
> 
> There are still some io that are stuck, which means the devcie is
> probably still opened. Thus nbd_config_put() can't reach here.
> I'm afraid this patch can't fix the io hung.
> 
> Matthew, can you try a test with this patch together with my patch below
> to comfirm my thought?
> 
> nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
> https://lists.debian.org/nbd/2022/04/msg00212.html.
> 

Re-submit this one, but fix it so we just test the bit to see if we need to skip
it, and change it so we only CLEAR when we're sure we're going to complete the
request.  Thanks,

Josef

