Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 58739184626
	for <lists+nbd@lfdr.de>; Fri, 13 Mar 2020 12:45:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06EC02044B; Fri, 13 Mar 2020 11:45:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 13 11:45:13 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E897320442
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Mar 2020 11:29:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lw-T2ahJbAdV for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Mar 2020 11:29:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 57BDE20443
	for <nbd@other.debian.org>; Fri, 13 Mar 2020 11:29:53 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h8so8991673iob.2
        for <nbd@other.debian.org>; Fri, 13 Mar 2020 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PoMJmL1hnneo2X5SSA9aG8mLu/s7Lqr0F3n7IPTI+3I=;
        b=TCsuoAgA16VfGLqWrxwK92fMnelLGfJ6UM+ghAKatLatdLRXx/6AF/FaRxqEW2GBey
         85J/T3jApJQAebtm85xBCudeMnizqiVmEvt0AKY3r/MZ67TYL/yrqzeWoBajXzvruDdE
         jHXMWIA7ELrY/ibXLZxIBbpSDpJiUiA2nv7yce15gbMoOR3F34c+KU+JiJfVMf0LgGnu
         pO7W+OmvqEARsGwWl8nV08DOcShvg5+431I/UaWWUiJS1botO2R1PG3gaAT6UOLO/fPL
         9/Aj+SHoda4J21X7jxEpb2xQKH8JxMVW+oJ5x8+5h/ejyp5BzzyI652jS7nrdylN0urT
         c2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PoMJmL1hnneo2X5SSA9aG8mLu/s7Lqr0F3n7IPTI+3I=;
        b=N0+11K6ja8cW9Tar8B9EJHSJ6fsoKUdhOeWOKb79uzq1Uf3LcTQq9KD7xA8gopv3EX
         FMi8D0GqNzUOrIoYFAM9/Z3VCUcfVzQRtBII19aB45ElU+DHcYZkCEpOW6RCYkIdlb7T
         eBvTMtveFmPzIl4B5nyGI0xPSomUoiyn926vQHjDUFs/UcRVK1C7GTAjlV/1HhPMcmBc
         cP/6Jx7Yjd0EVrutefAy0SOUcWK/Tm6LuRDZ+kJFX5XUL2+5rPfiSM4pBOP5QmXD4fwa
         oS/S9UD9bladcbil81BxXG8KslwdIl8DtLIaBKUThqjrN+LGa642c8XPVxIpNnTvIeZB
         M4Hg==
X-Gm-Message-State: ANhLgQ2lvrre+I1vhXmrZsuAm2g+Q2suudB6szC/8hwcikpk5/8F/Hwh
	RO7DUpM4ssTOAQP8JfnNWOQTuzD109TK3/5/VkA=
X-Google-Smtp-Source: ADFU+vslRAaDjBcQEc5evPtf5FaenUKJEM2egGZk75hkSAx/ZXDN7M2d2HUaVgWHXua/POZ82w1bxrhz2uM0aZlZJvc=
X-Received: by 2002:a6b:784a:: with SMTP id h10mr8283286iop.64.1584098989678;
 Fri, 13 Mar 2020 04:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200228064030.16780-1-houpu@bytedance.com> <b407f0d1-f07c-4d6b-9657-bb296557ff50@kernel.dk>
In-Reply-To: <b407f0d1-f07c-4d6b-9657-bb296557ff50@kernel.dk>
From: Hou Pu <houpu.main@gmail.com>
Date: Fri, 13 Mar 2020 19:29:38 +0800
Message-ID: <CAKHcvQidfK_04_BxLL_kVBC7e7+eeAfSX=W=8Xyi-HNU0NQ0OQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] nbd: requeue request if only one connection is configured
To: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Mike Christie <mchristi@redhat.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Hou Pu <houpu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TRMogxfb-lM.A._2B.JJ3aeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/852
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKHcvQidfK_04_BxLL_kVBC7e7+eeAfSX=W=8Xyi-HNU0NQ0OQ@mail.gmail.com
Resent-Date: Fri, 13 Mar 2020 11:45:14 +0000 (UTC)

On Thu, Mar 12, 2020 at 9:59 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 2/27/20 11:40 PM, Hou Pu wrote:
> > Hello,
> >
> > NBD server could be upgraded if we have multiple connections.
> > But if we have only one connection, after we take down NBD server,
> > all inflight IO could finally timeout and return error. These
> > patches fix this using current reconfiguration framework.
> >
> > I noticed that Mike has following patchset
> >
> > nbd: local daemon restart support
> > https://lore.kernel.org/linux-block/5DD41C49.3080209@redhat.com/
> >
> > It add another netlink interface (NBD_ATTR_SWAP_SOCKETS) and requeue
> > request immediately after recongirure/swap socket. It do not need to
> > wait for timeout to fire and requeue in timeout handler, which seems more
> > like an improvement. Let fix this in current framework first.
> >
> > Changes compared to v2:
> > Fix comments in nbd_read_stat() to be aligned with the code change
> > suggested by Mike Christie.
>
> Applied for 5.7.

Thanks.
And also thanks Josef and Mike for the review.

>
> --
> Jens Axboe
>

