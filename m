Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19A178A6B
	for <lists+nbd@lfdr.de>; Wed,  4 Mar 2020 06:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5524320195; Wed,  4 Mar 2020 05:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 05:57:09 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D2B542015A
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2020 05:41:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gSZY7jnuXTrT for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2020 05:41:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8F4592015F
	for <nbd@other.debian.org>; Wed,  4 Mar 2020 05:41:23 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u17so1020368iog.11
        for <nbd@other.debian.org>; Tue, 03 Mar 2020 21:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oGAsqYc72bEoMm5c+Kg6/9OPUTzZE5w2WwigLaxaXoI=;
        b=V3vgVSVi1PifYH8/BiyQQFw+AKBMrayaornjaWtah8jcSlGaUO2Y/9+PMk2zB8fpT6
         4D89K/f1z8JoD49rhR8BqBQ4q4OnDyDpXFH5BPuQFpG8LWjoO5RJaZ2bcRUEbT2Zgjhg
         eGVo3rN6a6iEEFXCjkoYH+jRoKSFaGyiufKuDJ3WFSPAGAqeBLKST/6BK8IVJ8rWhmI/
         cy7kCFmbzk0fY1ceMvvbyyK2UFMB8fOhzZhYdUryeao+todDatjf5QVx7wVvyBcUUglP
         Dz0UfhyoZgJNrZGNl7srlV+W6+0wqDij1I+QfhQ5uMEz/VKwUo0vFCdhBQ+xvd8kHIlL
         54/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGAsqYc72bEoMm5c+Kg6/9OPUTzZE5w2WwigLaxaXoI=;
        b=mmtdJQp8eqJp/6lSnMyHRqIFF3RsLLAWwRqOoiE45HhZgxCGEkAf9o1aVxjV2xQo2W
         AYX35hyrMe923jmzitNgNCvJtw5+HQR1Spner8qAJ6kucPOq5w1HLN4xmZC1xv7YUSiB
         RvmMLREgeN2tV8ltM488KCUmN5UFHL1SyGobcmm++qQc++7C0OOtTNC4ixB8rZPHp1nP
         PBapFCWjKu2FmTW33G4ikDkRWQ3/QB+iKf2k8fn9tfICfppsXmUEIis/iLb08FHO3PwK
         uCuHRFXMjabs0AETue6njUAK6nLO3mSBSKJoKe0XFrUULhxD5qMD/KhU6Lerj/5hmWFo
         GWyA==
X-Gm-Message-State: ANhLgQ38EPqQ4N9ofnlLCXAiYAAN588k0YSCwNenUIYju0H3hiqjo/Iu
	D0YvjHvNELbsHFZcQlFo7k3UGBQq9I2OAQ/CjCQ=
X-Google-Smtp-Source: ADFU+vtqFzkx1K1tdQMfqVQtrOXcymEVV8gqsk34YleyT3LfeT8jqC+J2+9c4cJo9fn3+CQFi+5YWWuoz/+OkhrEdUs=
X-Received: by 2002:a02:17c2:: with SMTP id 185mr1256156jah.120.1583300480275;
 Tue, 03 Mar 2020 21:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20200228064030.16780-1-houpu@bytedance.com> <20200228064030.16780-2-houpu@bytedance.com>
 <3b6ae210-f942-b74d-1e53-768c7e8c3675@toxicpanda.com> <5E5ED0BF.7030407@redhat.com>
In-Reply-To: <5E5ED0BF.7030407@redhat.com>
From: Hou Pu <houpu.main@gmail.com>
Date: Wed, 4 Mar 2020 13:41:09 +0800
Message-ID: <CAKHcvQg5usROp-53Nm4r06aKcJGACC6R-_o2wktszekmeHWF=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is configured
To: Mike Christie <mchristi@redhat.com>, Josef Bacik <josef@toxicpanda.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org, 
	Hou Pu <houpu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RH4hgpYxyUF.A.vpH.1M0XeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/847
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKHcvQg5usROp-53Nm4r06aKcJGACC6R-_o2wktszekmeHWF=Q@mail.gmail.com
Resent-Date: Wed,  4 Mar 2020 05:57:09 +0000 (UTC)

On Wed, Mar 4, 2020 at 5:48 AM Mike Christie <mchristi@redhat.com> wrote:
>
> On 03/03/2020 03:12 PM, Josef Bacik wrote:
> > On 2/28/20 1:40 AM, Hou Pu wrote:
> >> Nbd server with multiple connections could be upgraded since
> >> 560bc4b (nbd: handle dead connections). But if only one conncection
> >> is configured, after we take down nbd server, all inflight IO
> >> would finally timeout and return error. We could requeue them
> >> like what we do with multiple connections and wait for new socket
> >> in submit path.
> >>
> >> Signed-off-by: Hou Pu <houpu@bytedance.com>
> >> ---
> >>   drivers/block/nbd.c | 17 +++++++++--------
> >>   1 file changed, 9 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> >> index 78181908f0df..83070714888b 100644
> >> --- a/drivers/block/nbd.c
> >> +++ b/drivers/block/nbd.c
> >> @@ -395,16 +395,19 @@ static enum blk_eh_timer_return
> >> nbd_xmit_timeout(struct request *req,
> >>       }
> >>       config = nbd->config;
> >>   -    if (config->num_connections > 1) {
> >> +    if (config->num_connections > 1 ||
> >> +        (config->num_connections == 1 && nbd->tag_set.timeout)) {
> >
> > This is every connection, do you mean to couple this with
> > dead_conn_timeout? Thanks,
> >

Except this case tag_set.timeout==0 and num_connections == 1. As Mike
said below.

Regards.
Hou.

>
> In
>
> commit 2da22da573481cc4837e246d0eee4d518b3f715e
> Author: Mike Christie <mchristi@redhat.com>
> Date:   Tue Aug 13 11:39:52 2019 -0500
>
>     nbd: fix zero cmd timeout handling v2
>
> we can set tag_set.timeout=0 again.
>
> So if timeout != 0 and num_connections = 1, we requeue here and let
> nbd_handle_cmd->wait_for_reconnect decide to wait or fail the command if
> dead_conn_timeout is not set.
>
> If timeout = 0, then we give it more time because it might have just
> been a slow server or connection. I think this behavior is wrong for the
> case Hou is fixing. See comment in the next patch.
>

Yes. While we are waiting for a slow connection, we also take care if the
socket is reconfigured.

Regards.
Hou.

