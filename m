Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E284B6D83
	for <lists+nbd@lfdr.de>; Tue, 15 Feb 2022 14:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ECFA4203F4; Tue, 15 Feb 2022 13:33:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 15 13:33:12 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4816420339
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Feb 2022 13:17:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eGQqRxFnBxJj for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Feb 2022 13:17:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x62a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AAC50203CB
	for <nbd@other.debian.org>; Tue, 15 Feb 2022 13:17:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx21so4387310ejb.13
        for <nbd@other.debian.org>; Tue, 15 Feb 2022 05:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsJbGaa3SFcG2KERbDvW9xmJviCwqG46K8qkid7fn6c=;
        b=7XgS7fALQBQuwbclAnMxqO2wqnc/+bGyhHE6lujXNJouj8037qr9Ue3xmlYhI+AFsM
         f03sdWv+Ujf9RTFJyoBv7idlnbP7CFOaazsTBbodwXnN05FoLL135oSZZxVmGFnnwP88
         WH3bxdDxRsdRjGcjNZZO48JYgmAldIWUGcGXbXsjnGnIh9ZihL3KqC9/M1MbHs3GoBne
         zE83wH/HodNhR31zL6+Hqvc1xTPXqI9cJkDGWbw0rx6TjkaZPKZQOq6w46mlcAExg6az
         +Ec+2vyvtnJq1nDHQ82gJCkdM7D0dK0xKB5ba5B4yaS+xrvLCTuuVhVUZzMWRcV3I5k/
         IEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsJbGaa3SFcG2KERbDvW9xmJviCwqG46K8qkid7fn6c=;
        b=KyU2CwW/3zio2QRRjSzmCWG1ldIMpbV3cW2qtFUB1Tg+yRgCTO3DK68rqVleBqClNl
         iYHNoxvLMlznASUwnVtKhwELUYO+hFWNEJvRoCQiKOCSfOR7tnkqWCUoQLJAkmw4Jo0k
         1jrFwjwdEqCIra7Ca0aGoZv0CNoPl5WU6xUqf0wMCYfE53W5bDHG0/jZSkRwPssMhSzZ
         hsmCeXn3XwbKfwcnqWTNa9ZgQEgm9aTwwXUgcmCsu3Aqb5mm3BvB1eQ1qLfx2syAptCM
         vwMAWjcVAlr/x0E4NNeira7llfp2E8g9zTOgRPY0PB+nL8KBI8aEoBF/nAYqr6SA/djm
         fuDA==
X-Gm-Message-State: AOAM532BZgp74RHujtRFKEwJnKO5LeZDsbjrLphCO07E4UmOZsbWwYNl
	HrPR76oljq7dgRDQtt8epqy3o2yqCNdwy9KI3hjn
X-Google-Smtp-Source: ABdhPJzGcLJvBPy+H95ps/k6isFv1SA3/3aRTr93ZAojJyrKa1HFzpIz9t7VDfN9wQ5IPOeOZTgAe28YX895rwe8htA=
X-Received: by 2002:a17:907:9605:: with SMTP id gb5mr3161841ejc.490.1644931068478;
 Tue, 15 Feb 2022 05:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain> <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
 <YdSMqKXv0PUkAwfl@localhost.localdomain> <CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com>
 <CACycT3tTKBpS_B5vVJ8MZ1iuaF2bf-01=9+tAdxUddziF2DQ-g@mail.gmail.com>
In-Reply-To: <CACycT3tTKBpS_B5vVJ8MZ1iuaF2bf-01=9+tAdxUddziF2DQ-g@mail.gmail.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 15 Feb 2022 21:17:37 +0800
Message-ID: <CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <etzb1ZmEoNC.A.WlF.Yu6CiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1714
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com
Resent-Date: Tue, 15 Feb 2022 13:33:12 +0000 (UTC)

Ping again.

Hi Josef, could you take a look?

On Fri, Jan 21, 2022 at 4:34 PM Yongji Xie <xieyongji@bytedance.com> wrote:
>
> Ping.
>
> On Wed, Jan 5, 2022 at 1:36 PM Yongji Xie <xieyongji@bytedance.com> wrote:
> >
> > On Wed, Jan 5, 2022 at 2:06 AM Josef Bacik <josef@toxicpanda.com> wrote:
> > >
> > > On Tue, Jan 04, 2022 at 01:31:47PM +0800, Yongji Xie wrote:
> > > > On Tue, Jan 4, 2022 at 12:10 AM Josef Bacik <josef@toxicpanda.com> wrote:
> > > > >
> > > > > On Thu, Dec 30, 2021 at 12:01:23PM +0800, Yongji Xie wrote:
> > > > > > On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > > > > >
> > > > > > > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > > > > > > The rescuer thread might take over the works queued on
> > > > > > > > the workqueue when the worker thread creation timed out.
> > > > > > > > If this happens, we have no chance to create multiple
> > > > > > > > recv threads which causes I/O hung on this nbd device.
> > > > > > >
> > > > > > > If a workqueue is used there aren't really 'receive threads'.
> > > > > > > What is the deadlock here?
> > > > > >
> > > > > > We might have multiple recv works, and those recv works won't quit
> > > > > > unless the socket is closed. If the rescuer thread takes over those
> > > > > > works, only the first recv work can run. The I/O needed to be handled
> > > > > > in other recv works would be hung since no thread can handle them.
> > > > > >
> > > > >
> > > > > I'm not following this explanation.  What is the rescuer thread you're talking
> > > >
> > > > https://www.kernel.org/doc/html/latest/core-api/workqueue.html#c.rescuer_thread
> > > >
> > >
> > > Ahhh ok now I see, thanks, I didn't know this is how this worked.
> > >
> > > So what happens is we do the queue_work(), this needs to do a GFP_KERNEL
> > > allocation internally, we are unable to satisfy this, and thus the work gets
> > > pushed onto the rescuer thread.
> > >
> > > Then the rescuer thread can't be used in the future because it's doing this long
> > > running thing.
> > >
> >
> > Yes.
> >
> > > I think the correct thing to do here is simply drop the WQ_MEM_RECLAIM bit.  It
> > > makes sense for workqueue's that are handling the work of short lived works that
> > > are in the memory reclaim path.  That's not what these workers are doing, yes
> > > they are in the reclaim path, but they run the entire time the device is up.
> > > The actual work happens as they process incoming requests.  AFAICT
> > > WQ_MEM_RECLAIM doesn't affect the actual allocations that the worker thread
> > > needs to do, which is what I think the intention was in using WQ_MEM_RECLAIM,
> > > which isn't really what it's used for.
> > >
> > > tl;dr, just remove thee WQ_MEM_RECLAIM flag completely and I think that's good
> > > enough?  Thanks,
> > >
> >
> > In the reconnect case, we still need to call queue_work() while the
> > device is running. So it looks like we can't simply remove the
> > WQ_MEM_RECLAIM flag.
> >
> > Thanks,
> > Yongji

