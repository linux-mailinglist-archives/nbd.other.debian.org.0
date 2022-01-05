Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E4484DD4
	for <lists+nbd@lfdr.de>; Wed,  5 Jan 2022 06:54:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A8D3D206CD; Wed,  5 Jan 2022 05:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  5 05:54:10 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C273E206C3
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Jan 2022 05:36:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9qtlqQ8FX3UV for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Jan 2022 05:36:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x534.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0C8F0206BD
	for <nbd@other.debian.org>; Wed,  5 Jan 2022 05:36:21 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z29so157256715edl.7
        for <nbd@other.debian.org>; Tue, 04 Jan 2022 21:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VgHNMY/oH2D23eJ8YnQC9PGqKOxqMjg7ex0cwoNYvw=;
        b=TfQ+7KK7FadzF+6feiCdtVBGr2YKBJ0/m2Ewn/Ux2v8zcBGhMi+RcpbP0AQ7esNBj4
         5xzDRYlN+5MyqnGgDOEA6IqrM5gxUEhdS7f2dBGYW0j6jsrMCAObBYz42t+ur8TQRo9q
         MqHf9flC+EZvxDshS4nY8PW4CJ4mY10p9hE6ZLovgLr9zatjefgw45ob5ul/0PBtV67Q
         cBCa/ai//GY/fkoM4MWHbnG8h+o2ZhQ0bPxJbGUoaMDchkp2ug1qNrekTrQYyw512O3b
         NkLO668Y9OHPHfc4t14GJJtj0vcSL8CoCEmtNRLYyMtBwi28jTU51W6DWPy71IOMzRkL
         lPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VgHNMY/oH2D23eJ8YnQC9PGqKOxqMjg7ex0cwoNYvw=;
        b=Rodq1sAq4tG1bCNNa5hMmRmCwas8iheCOVwAMSBpqXq9wlKoBPSgyMvhQ2OTKdAYxB
         maZ6KUCHKkbVQVW8x3qa/uuRBBTmpv1QPd3m/4+P4VO2xk9SbEPXKDJixrAL3HW2Basy
         aZkNG6b2h4FMmnPd5iGk62GPTGH8EsetnFvul/6bL9F7qM5w97b7xzpbecrblFRy5Of7
         8m3b5XnU6F6jQw6lEeglBtVrNFQQova/qc08fC2pXmdjBx3faYfxCmUECqVEhlstrYlW
         dShMcqP7xf6/HC4drpKqmGmCvF9sDKQOHBi1k74W11vD/YO5cn5d/NKDdOumdhY1lrJ9
         sN3A==
X-Gm-Message-State: AOAM533kXkS7rpyBpcBcNVSankbM8trRRHgKJca18sUdOSDjYzTfWS/6
	XfdzIWpY0VXXrTKfBM6wg5HTQywJqRDKSLDHDX7lQW/biA==
X-Google-Smtp-Source: ABdhPJyYoy8HVOUAZ3bFmvX8q1dsGo/xVnT1tb+flXEuXsAcD7mTwmYMK8G9qFzfKlw74DmZjaHIucIMHVeoTFYeCwQ=
X-Received: by 2002:a17:906:4e45:: with SMTP id g5mr40714474ejw.257.1641360979055;
 Tue, 04 Jan 2022 21:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain> <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
 <YdSMqKXv0PUkAwfl@localhost.localdomain>
In-Reply-To: <YdSMqKXv0PUkAwfl@localhost.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 5 Jan 2022 13:36:08 +0800
Message-ID: <CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yKhi3c0_rvP.A.utG.CKT1hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1670
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com
Resent-Date: Wed,  5 Jan 2022 05:54:10 +0000 (UTC)

On Wed, Jan 5, 2022 at 2:06 AM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Tue, Jan 04, 2022 at 01:31:47PM +0800, Yongji Xie wrote:
> > On Tue, Jan 4, 2022 at 12:10 AM Josef Bacik <josef@toxicpanda.com> wrote:
> > >
> > > On Thu, Dec 30, 2021 at 12:01:23PM +0800, Yongji Xie wrote:
> > > > On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > > >
> > > > > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > > > > The rescuer thread might take over the works queued on
> > > > > > the workqueue when the worker thread creation timed out.
> > > > > > If this happens, we have no chance to create multiple
> > > > > > recv threads which causes I/O hung on this nbd device.
> > > > >
> > > > > If a workqueue is used there aren't really 'receive threads'.
> > > > > What is the deadlock here?
> > > >
> > > > We might have multiple recv works, and those recv works won't quit
> > > > unless the socket is closed. If the rescuer thread takes over those
> > > > works, only the first recv work can run. The I/O needed to be handled
> > > > in other recv works would be hung since no thread can handle them.
> > > >
> > >
> > > I'm not following this explanation.  What is the rescuer thread you're talking
> >
> > https://www.kernel.org/doc/html/latest/core-api/workqueue.html#c.rescuer_thread
> >
>
> Ahhh ok now I see, thanks, I didn't know this is how this worked.
>
> So what happens is we do the queue_work(), this needs to do a GFP_KERNEL
> allocation internally, we are unable to satisfy this, and thus the work gets
> pushed onto the rescuer thread.
>
> Then the rescuer thread can't be used in the future because it's doing this long
> running thing.
>

Yes.

> I think the correct thing to do here is simply drop the WQ_MEM_RECLAIM bit.  It
> makes sense for workqueue's that are handling the work of short lived works that
> are in the memory reclaim path.  That's not what these workers are doing, yes
> they are in the reclaim path, but they run the entire time the device is up.
> The actual work happens as they process incoming requests.  AFAICT
> WQ_MEM_RECLAIM doesn't affect the actual allocations that the worker thread
> needs to do, which is what I think the intention was in using WQ_MEM_RECLAIM,
> which isn't really what it's used for.
>
> tl;dr, just remove thee WQ_MEM_RECLAIM flag completely and I think that's good
> enough?  Thanks,
>

In the reconnect case, we still need to call queue_work() while the
device is running. So it looks like we can't simply remove the
WQ_MEM_RECLAIM flag.

Thanks,
Yongji

