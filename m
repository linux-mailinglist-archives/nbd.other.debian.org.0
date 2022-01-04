Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A954847BA
	for <lists+nbd@lfdr.de>; Tue,  4 Jan 2022 19:24:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5AE1B2057A; Tue,  4 Jan 2022 18:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  4 18:24:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A9172055D
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Jan 2022 18:06:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OZNDbNnHNp2C for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Jan 2022 18:06:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x832.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5221420328
	for <nbd@other.debian.org>; Tue,  4 Jan 2022 18:06:37 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id z9so34904448qtj.9
        for <nbd@other.debian.org>; Tue, 04 Jan 2022 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5RKu6IuIqmq49BMD5LnbgPbbKed9H3mhBHP0VD+Ye6c=;
        b=bH4v26yxUQjm4cWLarxsSFK/FSUA8Cq83MSbqyvKKF+U9ssGI1t2wukWVezRWXF+k8
         bA6zREUN7SV3pUebV8HpwG1hWpByR6BmTqOwgbDXiazflHJR0u9dMDlZjSTgpG5OK8MG
         +P42EAdzFtNxR1Tw94FqApCZKqC6Kmf1y9wCb5QB7rWK/tNmv5EiAIOeqHmDQqeqbyBy
         Oq4+Wn8Bg0by3/GBN5H8PhT13vghmvuEQtXWgCnpIUl7xo/u1dukfdhUwZl0pSiDKMky
         FNiQPKrZhCODpn9HBG/6lAvePDaU90LwfqeSEBH9HFWV8CLUuc3klImHvvp+tj3WC1Ar
         0OMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5RKu6IuIqmq49BMD5LnbgPbbKed9H3mhBHP0VD+Ye6c=;
        b=DQfdiQEPw7q/0BaF6bXaejuiOOhmL0TcWWpyI/TJHCiYBJw0ZCb1zE5JhyDhzgC4r1
         Us/yh/kDj7kSqr+SYw5FbISsLVM6xw3kXzBRvSP/Lr5++9nNhDXFV3vbIcSf7M0XRd6M
         ccC8CohhpOMu51G2pqS7AoeadzIo04N5UV5eA4X1PEPprb1W8j3HWniSpd3qDeBk83Mv
         aR/hjK5HvcJuWHNEEAFg5mFFE9+QMo+o201sRy4Cbkxhs3VCsjN2G5mEix0kpMNBMCxG
         WBFN0Fa1NFim6132bIPr0sa+5QkV99wAi/Ska04Gg/xIFbdoq0ujzN7IJdyylI+TUp1d
         J6kg==
X-Gm-Message-State: AOAM532XxS/qjGfG6BI6SU51d2d0ou4sJam7vPYFDLLi4q+LHexSiagL
	6Ao0UR2NPCQXDx1DMqB/baT3GA==
X-Google-Smtp-Source: ABdhPJzqTxALsN0VOvXgTQUjtVYXWrX+86Lp+vIhivpHeE975eTN2g/Nkq+f9gnjkysW6xhZ9C+Bzg==
X-Received: by 2002:ac8:674d:: with SMTP id n13mr44576838qtp.491.1641319594564;
        Tue, 04 Jan 2022 10:06:34 -0800 (PST)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id i6sm3044186qtx.22.2022.01.04.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 10:06:33 -0800 (PST)
Date: Tue, 4 Jan 2022 13:06:32 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
Message-ID: <YdSMqKXv0PUkAwfl@localhost.localdomain>
References: <20211227091241.103-1-xieyongji@bytedance.com>
 <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain>
 <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7c9kMf0eRTH.A.WzF.JDJ1hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1669
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YdSMqKXv0PUkAwfl@localhost.localdomain
Resent-Date: Tue,  4 Jan 2022 18:24:09 +0000 (UTC)

On Tue, Jan 04, 2022 at 01:31:47PM +0800, Yongji Xie wrote:
> On Tue, Jan 4, 2022 at 12:10 AM Josef Bacik <josef@toxicpanda.com> wrote:
> >
> > On Thu, Dec 30, 2021 at 12:01:23PM +0800, Yongji Xie wrote:
> > > On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > > > The rescuer thread might take over the works queued on
> > > > > the workqueue when the worker thread creation timed out.
> > > > > If this happens, we have no chance to create multiple
> > > > > recv threads which causes I/O hung on this nbd device.
> > > >
> > > > If a workqueue is used there aren't really 'receive threads'.
> > > > What is the deadlock here?
> > >
> > > We might have multiple recv works, and those recv works won't quit
> > > unless the socket is closed. If the rescuer thread takes over those
> > > works, only the first recv work can run. The I/O needed to be handled
> > > in other recv works would be hung since no thread can handle them.
> > >
> >
> > I'm not following this explanation.  What is the rescuer thread you're talking
> 
> https://www.kernel.org/doc/html/latest/core-api/workqueue.html#c.rescuer_thread
> 

Ahhh ok now I see, thanks, I didn't know this is how this worked.

So what happens is we do the queue_work(), this needs to do a GFP_KERNEL
allocation internally, we are unable to satisfy this, and thus the work gets
pushed onto the rescuer thread.

Then the rescuer thread can't be used in the future because it's doing this long
running thing.

I think the correct thing to do here is simply drop the WQ_MEM_RECLAIM bit.  It
makes sense for workqueue's that are handling the work of short lived works that
are in the memory reclaim path.  That's not what these workers are doing, yes
they are in the reclaim path, but they run the entire time the device is up.
The actual work happens as they process incoming requests.  AFAICT
WQ_MEM_RECLAIM doesn't affect the actual allocations that the worker thread
needs to do, which is what I think the intention was in using WQ_MEM_RECLAIM,
which isn't really what it's used for.

tl;dr, just remove thee WQ_MEM_RECLAIM flag completely and I think that's good
enough?  Thanks,

Josef

