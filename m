Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3F8483BC0
	for <lists+nbd@lfdr.de>; Tue,  4 Jan 2022 06:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2DC32040E; Tue,  4 Jan 2022 05:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  4 05:48:09 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 43DCD20404
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Jan 2022 05:32:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jzLgb0JSS8xP for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Jan 2022 05:32:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x531.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 62B8E2012A
	for <nbd@other.debian.org>; Tue,  4 Jan 2022 05:32:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o6so143939082edc.4
        for <nbd@other.debian.org>; Mon, 03 Jan 2022 21:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GNLlKNJwh8yDutcgTSNh3rJ5e/XoBEFDQk6XXJo2O/I=;
        b=orxNeTfTE2OzEWokfk2Wh8DVYaqFMPwA1c+9b77lYcTuW6hbwkykKmkk7cSbeiqEsC
         pvf1eThjSWeQ360rDEfrIO+xStpX7Bc9tS8aHMzcN8CHOWOV7CDW9P7LDw0IqqUXo2XA
         u+yRsLAjnZ7KaizfhC6K/euSCNQhEAM5jliWYJljeNRZjegwPtQKhrCWurC5pKXIkhLy
         LEYbahcrfGS1BSgokeclMoh18wDTkTtoDr/BdwzMhCugoaDD95JsMw0KIS1S/FP1kGNf
         Fne5WM6AKOrhZjcdKBRmKxYnG2iBpNLpoGmzagQw4D9mh3g/oAcVG0Hm0J2f2eqYLLB3
         m5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GNLlKNJwh8yDutcgTSNh3rJ5e/XoBEFDQk6XXJo2O/I=;
        b=li9TaCAOkjUH5xjzJ6huIXTpA1driiI2GpkJMWzyj7kl8qwOBtHv5teO66BN5wwTNi
         BHiqdqNDJ7KMyYzGhQ1maX+UgD9ElX4R6DSEP7XD6WGZZRSvbQgAuT8pbTRaliSiaWeq
         rTtTo1emofrPcoPXQTPfCDjqeyd63Q4tR9iqkYssGEDaOBrUKdix4W/xbikRdmTZXswJ
         7I4kcEUfKQ2ZlHMthTAYN49LDN2VOskS2yJ0PmicdNIIhkKq4QoQ33ouvEdJZ+Sj0RFH
         9s6FsH1CRTbcFkx/nkgih2ad/C2sDTrAxwIWS1fub8byxcE5vssMNkZRs3Gmu70xfKwR
         s2Lw==
X-Gm-Message-State: AOAM533N6XDZ1TKiuKyiGx8BCEbZKS/P77V6QHIP1Q/XXRs2w/ItR+wy
	ycYp/ne9r9EfJ6mRqkQTFAA/Dlnq3WVnsVX5uD2Q5xb6ww==
X-Google-Smtp-Source: ABdhPJz4dWu/xStNE8Cp7gQF0Nk8Dd7RPTLq2p8D7/HOHBRr/cDSTbtPSjh/GJNQrR2ul1NA8DHUoRiaAuKq1ZJ6tkM=
X-Received: by 2002:a17:906:6a0d:: with SMTP id qw13mr40748060ejc.490.1641274318122;
 Mon, 03 Jan 2022 21:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com> <YdMgCS1RMcb5V2RJ@localhost.localdomain>
In-Reply-To: <YdMgCS1RMcb5V2RJ@localhost.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 4 Jan 2022 13:31:47 +0800
Message-ID: <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2AvoWzXBSsN.A.0oF.Z-90hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1668
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com
Resent-Date: Tue,  4 Jan 2022 05:48:09 +0000 (UTC)

On Tue, Jan 4, 2022 at 12:10 AM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Thu, Dec 30, 2021 at 12:01:23PM +0800, Yongji Xie wrote:
> > On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > > The rescuer thread might take over the works queued on
> > > > the workqueue when the worker thread creation timed out.
> > > > If this happens, we have no chance to create multiple
> > > > recv threads which causes I/O hung on this nbd device.
> > >
> > > If a workqueue is used there aren't really 'receive threads'.
> > > What is the deadlock here?
> >
> > We might have multiple recv works, and those recv works won't quit
> > unless the socket is closed. If the rescuer thread takes over those
> > works, only the first recv work can run. The I/O needed to be handled
> > in other recv works would be hung since no thread can handle them.
> >
>
> I'm not following this explanation.  What is the rescuer thread you're talking

https://www.kernel.org/doc/html/latest/core-api/workqueue.html#c.rescuer_thread

> about?  If there's an error we close the socket which will error out the recvmsg
> which will make the recv workqueue close down.

When to close the socket? The nbd daemon doesn't know what happens in
the kernel.

>
> > In that case, we can see below stacks in rescuer thread:
> >
> > __schedule
> >   schedule
> >     scheule_timeout
> >       unix_stream_read_generic
> >         unix_stream_recvmsg
> >           sock_xmit
> >             nbd_read_stat
> >               recv_work
> >                 process_one_work
> >                   rescuer_thread
> >                     kthread
> >                       ret_from_fork
>
> This is just the thing hanging waiting for an incoming request, so this doesn't
> tell me anything.  Thanks,
>

The point is the *recv_work* is handled in the *rescuer_thread*.
Normally it should be handled in *work_thread* like:

__schedule
   schedule
     scheule_timeout
       unix_stream_read_generic
         unix_stream_recvmsg
           sock_xmit
             nbd_read_stat
               recv_work
                 process_one_work
                   *work_thread*
                     kthread
                       ret_from_fork

Thanks,
Yongji

