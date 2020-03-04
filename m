Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E1178B64
	for <lists+nbd@lfdr.de>; Wed,  4 Mar 2020 08:30:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1EBF0201D8; Wed,  4 Mar 2020 07:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 07:30:10 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8F37E201D5
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2020 07:14:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3izsw40LE4Ro for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2020 07:14:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1751D201CA
	for <nbd@other.debian.org>; Wed,  4 Mar 2020 07:14:02 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s24so1257448iog.5
        for <nbd@other.debian.org>; Tue, 03 Mar 2020 23:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYQ/T5LGh6mDEqk2GDSOHdMSMQLCSwCgtcZjqBiXPaA=;
        b=enarFx7guPIjYL4/O9nUVrLD/dD4a2imxHUWiQNYtnRlSR6ot+3O5uKkUt5hYmyOjT
         IR56n4eGbk9JNb3ghZxZXFlkzDCTdtOnPPLZSPf+AQPxg7Hg0lEgsPyAXeO6BqmZyl5a
         Eodq39CkpTf8mZq/7uMH5TkuQ9aW+pMuPmFFmjokjPlU0TNyTd1a9cJreVIKgwkUe7Yx
         bo5YHJ7yoZiuXRTKtCoQ1HHLavCL/xB1UWTTv+R1Dm7twndXKA3VZuTXy/zwAyCgZ29e
         UnOuB7hRNJe5B/EPWAbwDJXmqaMzC8aJksYUx6IhefyYphtZB0D+2p7A7dSPy/WxOOEL
         3LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYQ/T5LGh6mDEqk2GDSOHdMSMQLCSwCgtcZjqBiXPaA=;
        b=dnCB7RX26VoUvvtYouBfN8higx/Fr3Ri+Ep2ZeLLZ+0Lvp/EY93hZ/MSbEYbTDXoqr
         PM59eUnRBLJTnZKlam846k6aC7Iq0C6A5lXQ/5Wyz/Ha0v0KsBtoUKfEYoqci1Gie/xt
         Z7Kskms8T0BJICC0OZqUBPfHjB0whf+zDdlIrMQsLRptH23u2n3ZhA4g3pA+08ukU2ym
         dWUIraEgpTDe7K46P9EamYERj0NLwXxXwq1x4nscBirDvm94HdQk1TfRz8n2+2IYc94j
         1Tpbx6nOqUfasLeknlhfYK6wR+IAdZ6D37hxP4OimF097vT4nq+lcJk50PQ/RtevXNq/
         xThg==
X-Gm-Message-State: ANhLgQ3DeeolWbLxaG9rwxei2+3je5e6Na0mHva/pT8HTv16d5HFWF1q
	8LUqEVtC9jS2t2OpzPBe0dXOr5jJwAoJYWFopuc=
X-Google-Smtp-Source: ADFU+vtbk6BExaveIxYZPxub+nRcosNMbOyMiuZ32caPDE9hpdGbBKA6sNZd5YMvC2pCwMEdR2mmqiW/ycFDXPK9Vhk=
X-Received: by 2002:a5d:9e0d:: with SMTP id h13mr1079955ioh.98.1583306038810;
 Tue, 03 Mar 2020 23:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20200228064030.16780-1-houpu@bytedance.com> <20200228064030.16780-3-houpu@bytedance.com>
 <34249aaa-7f0e-d0f4-7c1a-28aee9bddaa0@toxicpanda.com> <5E5ED4FF.8020209@redhat.com>
 <5E5ED861.6020209@redhat.com>
In-Reply-To: <5E5ED861.6020209@redhat.com>
From: Hou Pu <houpu.main@gmail.com>
Date: Wed, 4 Mar 2020 15:13:47 +0800
Message-ID: <CAKHcvQgQqqwg3rN_vrk5ZmuAzd1QVfJmh5b0xSu7ovrKJHmhAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: requeue command if the soecket is changed
To: Mike Christie <mchristi@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk, linux-block@vger.kernel.org, 
	nbd@other.debian.org, Hou Pu <houpu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G_yu3kROz7F.A.S3D.Ck1XeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/848
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKHcvQgQqqwg3rN_vrk5ZmuAzd1QVfJmh5b0xSu7ovrKJHmhAw@mail.gmail.com
Resent-Date: Wed,  4 Mar 2020 07:30:10 +0000 (UTC)

On Wed, Mar 4, 2020 at 6:21 AM Mike Christie <mchristi@redhat.com> wrote:
>
> On 03/03/2020 04:06 PM, Mike Christie wrote:
> > On 03/03/2020 03:13 PM, Josef Bacik wrote:
> >> On 2/28/20 1:40 AM, Hou Pu wrote:
> >>> In commit 2da22da5734 (nbd: fix zero cmd timeout handling v2),
> >>> it is allowed to reset timer when it fires if tag_set.timeout
> >>> is set to zero. If the server is shutdown and a new socket
> >>> is reconfigured, the request should be requeued to be processed by
> >>> new server instead of waiting for response from the old one.
> >>>
> >>> Signed-off-by: Hou Pu <houpu@bytedance.com>
> >>
> >> I'm confused by this, if we get here we've already timed out and
> >> requeued once right?  Why do we need to requeue again?  Thanks,
> >>

Please see Mike's comments below. Thanks.

> >
> > We may not have timed out already. If the tag_set.timeout=0, then the
> > block timer will fire every 30 seconds. This could be the first time the
> > timer has fired. If it has fired multiple times already then it still
> > would not have been requeued because the num_connections=1 code just
> > does a BLK_EH_RESET_TIMER when timeout=0 and does not have support for
> > detecting reconnects.
> >
> > In this second patch if timeout=0 and num_connections=1 we restart the
> > command when the command timer fires and we detect a new connection
> > (nsock->cookie has incremented).
> >
> > I was saying in the last patch, maybe waiting for reconnect is wrong.
> > Does a cmd timeout=0 mean to wait for a reconnect or in this patch
> > should we do:
> >
> > 1. if timeout=0, num_connections=1, and the cmd timer fires and the
> > conneciton is marked dead then requeue the command.
> > 2. we then rely on the dead_conn_timeout code to decide how long to wait
> > for a reconnect.
> >

With the above 2 steps, we have same timeout action in following three case:
A. connections > 1
B. connections ==1 && tag_set.timeout > 0
C. connections ==1 && tag_set.timeout = 0
In all above case, socket is marked dead if needed. Request is requeued.
This also means that if timeout is set to 0 by user space, it will not
have any effect.

This looks good only except that the behavior of case C is not same as before.
(Before we wait until the request is completed. Now wait at most
dead_conn_timeout)
I am not sure if any user space tools relay on it.

I'd like to say that I prefer this way than reseting timer until the
request is completed.
But for now it might be better to keep the behavior same with before.
So I'd like to suggest that we fix reconnection in case B and C with
current patches if you agree.

Thanks.

>
> Oh yeah, I had thought Hou implemented timeout=0 to wait for a reconnect
> to handle existing apps. However, I am not sure if they exist. When we
> had timeout=0 support the first time then we did not have multi conn and
> reconnect support yet.

I was trying to keep the behavior of timeout=0 same as before, with
the difference
of only requeue the cmd if needed. I currently do not configure timeout to 0
in our environment.

>
> The current timeout=0 and reconnect support does not work since that is
> what Hou is implementing, so we can decide the behavior now.
>

Please see above.

Thanks and Regards
Hou.

