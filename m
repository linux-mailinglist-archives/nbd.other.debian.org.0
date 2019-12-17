Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE20123456
	for <lists+nbd@lfdr.de>; Tue, 17 Dec 2019 19:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C519120418; Tue, 17 Dec 2019 18:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec 17 18:06:09 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ED1BA204BD
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Dec 2019 17:50:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Vpbdw1-jzis9 for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Dec 2019 17:50:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ABB76204CA
	for <nbd@other.debian.org>; Tue, 17 Dec 2019 17:50:34 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v3so12010995ioj.5
        for <nbd@other.debian.org>; Tue, 17 Dec 2019 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PIHajc5T69riCgfx1WTM9wSNYlMqcBP3FW3/e8WLwW8=;
        b=c2/nDvfyq4GTr+gc8nYpZSJO9zSjRaTVbXSwTjz040mkufZ1aIt3/Tv2L+3w7VDOvd
         k5F7o4O3pauikobpVeY6fjBJDdeq/opt78VnHVbkEjqtfFnAuqGWJLCGsEoXCHvVfQcT
         ucT7ICyumVsU4+GKOuBzskQXQMfv6vmgoYGJARKFB9svsd/HcNyHLJIVnqv1TeWEf0v9
         d8xhkBWyuXIM6iIKD/MPqwWeg4w0ffKhdMEpUDW0upWU9iBYt8xVr2lYV7hZ7rlAi8uA
         0ARanpwf7dLBwaLlHycfWPs74/USc92rW3mdOdyvH7OghrxSFh2qDOJF232anXxhD9rF
         ZHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PIHajc5T69riCgfx1WTM9wSNYlMqcBP3FW3/e8WLwW8=;
        b=ivCiLNKlXdYgvCNGx3S8v6vBBProju//MoODvcjWy0CG6bxPLPPPEsZNVjchhphhY6
         HsYcUC3pzsiMvnFnFphRYt14fZdCuUq3ZQtkglQd+hOgSeXsFNGhDDrjtLgfW6inWkP4
         IFNrCe08lJhxkHx0xK4IWsQK5jXWEr7wHi13sdk1SOL838y0ol7BkNkywS1blcWhlc1Q
         VxDkOKNuKhQgivXdMkAtHwUqFwHoxuvUylS+gqrVJp3x5yoMk8vuyuLPpKRfl4sA6kQd
         VpOxpZimQO5RjRaWX/IPDWE+ujNyGks70e1TjD83qwqeBF8AoQu1Zp9CnEfVLP61OJvp
         4Rrw==
X-Gm-Message-State: APjAAAUqLZiq/IkNaiHGhTjt8gVGcN/MOmxF5b6Y60hrRuRYGdNml/KG
	4SCgFptP4uaGtLvetMjnPaBN7A==
X-Google-Smtp-Source: APXvYqwVrKM1N+oHGRkj51mPZn4JC/P64LM/EyVU/TOjtftWlFuKwEr+DIXhrirm0a1jR8TKm6Ajbg==
X-Received: by 2002:a02:3f26:: with SMTP id d38mr18522848jaa.53.1576605031200;
        Tue, 17 Dec 2019 09:50:31 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id r22sm6893741ilb.25.2019.12.17.09.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 09:50:30 -0800 (PST)
Subject: Re: [PATCH] nbd: fix shutdown and recv work deadlock v2
To: Mike Christie <mchristi@redhat.com>, sunke32@huawei.com,
 nbd@other.debian.org, josef@toxicpanda.com, linux-block@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20191208225150.5944-1-mchristi@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <89b62516-087a-d5f7-6f53-749df63129cf@kernel.dk>
Date: Tue, 17 Dec 2019 10:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191208225150.5944-1-mchristi@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qj9KoyM9zUH.A.EEE.RkR-dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/757
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89b62516-087a-d5f7-6f53-749df63129cf@kernel.dk
Resent-Date: Tue, 17 Dec 2019 18:06:09 +0000 (UTC)

On 12/8/19 3:51 PM, Mike Christie wrote:
> This fixes a regression added with:
> 
> commit e9e006f5fcf2bab59149cb38a48a4817c1b538b4
> Author: Mike Christie <mchristi@redhat.com>
> Date:   Sun Aug 4 14:10:06 2019 -0500
> 
>     nbd: fix max number of supported devs
> 
> where we can deadlock during device shutdown. The problem occurs if
> the recv_work's nbd_config_put occurs after nbd_start_device_ioctl has
> returned and the userspace app has droppped its reference via closing
> the device and running nbd_release. The recv_work nbd_config_put call
> would then drop the refcount to zero and try to destroy the config which
> would try to do destroy_workqueue from the recv work.
> 
> This patch just has nbd_start_device_ioctl do a flush_workqueue when it
> wakes so we know after the ioctl returns running works have exited. This
> also fixes a possible race where we could try to reuse the device while
> old recv_works are still running.

Applied, thanks Mike.

-- 
Jens Axboe

