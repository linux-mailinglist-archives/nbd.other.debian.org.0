Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E0649481947
	for <lists+nbd@lfdr.de>; Thu, 30 Dec 2021 05:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9702B20235; Thu, 30 Dec 2021 04:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 30 04:18:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3BB972021F
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 Dec 2021 04:01:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 96Fd5v8Id5Sw for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 Dec 2021 04:01:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 47F1220220
	for <nbd@other.debian.org>; Thu, 30 Dec 2021 04:01:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m21so94524028edc.0
        for <nbd@other.debian.org>; Wed, 29 Dec 2021 20:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5onrs9lSEaHmvYpP7Y+ZzwiLXT0++XAWXsdC8ftsfM=;
        b=eW8aWt+e/Eht2JXn+QcRsIlGQtn13L3SfDZa2aeBH8mDWXtdnt2EgOaMcRpNeTwfGM
         yCUCa+G1GvDUVT4PVoj1pGmKAVJoo5l90f6aXco45+KpucB0PH+REvGR2xN1Sv8/Ea3R
         qQ09TbK7wJZlfB1OZiVe3hgujFPHps6dHCuK1JGj6lwffiLoUmk76/jC8cpWrRyq5Xdq
         wsju7O1itCrafDBBgLymyovaQhoHmuIja931eeS0Mz9431kFwhXpUefcP37ekmp5rIRy
         7q2+7/BRfLJCseYWogIM9zKab3izoKfvSUlFTPKo4xXgdZWboqOR56J+zabEc51fXwuO
         +YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5onrs9lSEaHmvYpP7Y+ZzwiLXT0++XAWXsdC8ftsfM=;
        b=J20Rh/DGHlpTvWHyM2i9ZSE/+15fviRZp043TyWsdiWGDpfvrUFugGMBT0Q0PmbiWs
         7V/b88X9DJcstD6e7yvtI5ALXl14y15Do8FnKldiNbDTg07ccsO6Z2VUqaDuRId6lF5H
         6yeGZ/J7N5Cxmc3QJoZDu9aMHkK5cU4MEKB0ApPYJm+n33Jl8m88UvhFb/d8QtEix3NS
         zawXrcoJfxCoc6XbIevwsi2G3HRQ/y6PY5+i9IJZWGxY/Lu2R74KRgTte9XiPPfShBIj
         gkFRK/4hUeVnNmD2UWTxdGdorSK4PbyZlHNhlcGXj5jFgLdMEGfCz0apsOvRLYchgY/f
         FZeA==
X-Gm-Message-State: AOAM532QPshwd4DXUYg5X9Rc3WwZ+wkEU38dFzXyLba5T1eY+sf+6VP+
	zIDCxn7cwuV4YCL/zW/qBut3kuVDj4/nivZLgEF1haWIirWL
X-Google-Smtp-Source: ABdhPJwwN4Iso2fFaoeNHAASddkpjxDEcW4ydhjnGSeZ7ramQSBfNRtaYA2Ye43/a6HNM5+6L9P2K7DemHTdE1iYWZo=
X-Received: by 2002:a17:907:1c9c:: with SMTP id nb28mr25007879ejc.452.1640836893881;
 Wed, 29 Dec 2021 20:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
In-Reply-To: <Ycycda8w/zHWGw9c@infradead.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 30 Dec 2021 12:01:23 +0800
Message-ID: <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Christoph Hellwig <hch@infradead.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V35T84RSQYC.A.33G.CMTzhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1665
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com
Resent-Date: Thu, 30 Dec 2021 04:18:10 +0000 (UTC)

On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > The rescuer thread might take over the works queued on
> > the workqueue when the worker thread creation timed out.
> > If this happens, we have no chance to create multiple
> > recv threads which causes I/O hung on this nbd device.
>
> If a workqueue is used there aren't really 'receive threads'.
> What is the deadlock here?

We might have multiple recv works, and those recv works won't quit
unless the socket is closed. If the rescuer thread takes over those
works, only the first recv work can run. The I/O needed to be handled
in other recv works would be hung since no thread can handle them.

In that case, we can see below stacks in rescuer thread:

__schedule
  schedule
    scheule_timeout
      unix_stream_read_generic
        unix_stream_recvmsg
          sock_xmit
            nbd_read_stat
              recv_work
                process_one_work
                  rescuer_thread
                    kthread
                      ret_from_fork

Thanks,
Yongji

