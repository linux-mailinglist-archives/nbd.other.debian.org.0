Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF5C143F3E
	for <lists+nbd@lfdr.de>; Tue, 21 Jan 2020 15:18:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 467B52045B; Tue, 21 Jan 2020 14:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 21 14:18:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6A9F520451
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jan 2020 14:00:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.96 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id W_FteMAeU0hd for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jan 2020 14:00:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x842.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6CF232041C
	for <nbd@other.debian.org>; Tue, 21 Jan 2020 14:00:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e5so2640715qtm.6
        for <nbd@other.debian.org>; Tue, 21 Jan 2020 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T3pQh4UckFpVVYMnTU2C2nEcKAWZ5QNLADQwFYgscxc=;
        b=s1NxKgcB7b2fWkPqDuWtLBrJmbzy3Gu/G0nXXFUWS78t64NBLo20y2YZSuUdMCk3Yz
         jYaCNwqEW92+eDZplCRchAjcgns8MD3xrEKum4irgThfd6wJ3m3NEZtti3VRiBEtqZMX
         0DY2DoqphpU2VTi6QKgibhWu46oYTnHcS37hDbPsTcJCdOhRNayyalaEWCBQ7N8Y/RjX
         pmfPS7JwWzYnQGP015HgEYi8rJA6gdT5rWXQD0vov6sjex5rC60W5fPGhwL7jEWqsIeN
         tnlLJRc+ykSzCTdhMqLc37iCtwOYbusZX7wFDY/ARsizrqbK6RmrObrUywI9LI8ZCauK
         gRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T3pQh4UckFpVVYMnTU2C2nEcKAWZ5QNLADQwFYgscxc=;
        b=lc+NYqwtU85MKUARdeGAcDjlW2QT0VNj59T2D8xbvEnhpBW4uFmsNMXg6FVHqQUxH1
         noi/5ue5/2mAwjQGBxfG2vfGfwp/UpwaP5hJoBx4Ww6x/hotDfIsNhNbTHsyTN58xjmv
         Z559kxxMMfKxQoKOqSzIpeAWmJq+dz0VGo+hJscEUzWbooRZqWtGn0REHZqBuHKf61Pm
         7tDgRsEwGhJKsIOJnZA545lIkkazYW3D+ztpo0MzFq1JvxaLfIYZV9zDkA98CY/RLG6b
         uI3wepe/cp4ne64ieJ+Ysq26BiEDSvhJQUF2Db9BHVSosFJjZKcaj4S5kCdMp/uMCyjv
         PbQg==
X-Gm-Message-State: APjAAAUkvk/iLoTlNWIyRNGnu6fJoEWAZKMAb0WR5xAnljJVQ678yO6G
	+nh4anQzR3WfDCQgf0OjYjVtQQ==
X-Google-Smtp-Source: APXvYqx3fQrBeqZBE7DHfQCEm1KagdXQie8eYLDq2jkZfFZ5KwawetnBY3UW3WmqbvJIAJYtq6VOFA==
X-Received: by 2002:ac8:4657:: with SMTP id f23mr4584941qto.378.1579615237725;
        Tue, 21 Jan 2020 06:00:37 -0800 (PST)
Received: from ?IPv6:2620:10d:c0a8:1102:ce0:3629:8daa:1271? ([2620:10d:c091:480::822a])
        by smtp.gmail.com with ESMTPSA id a36sm19768784qtk.29.2020.01.21.06.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 06:00:36 -0800 (PST)
Subject: Re: [PATCH] nbd: add a flush_workqueue in nbd_start_device
To: Sun Ke <sunke32@huawei.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20200121124813.13332-1-sunke32@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <82a3eb7e-883c-a091-feec-27f3937491ab@toxicpanda.com>
Date: Tue, 21 Jan 2020 09:00:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121124813.13332-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xz0aRmJbxQC.A.oKB.hgwJeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/777
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/82a3eb7e-883c-a091-feec-27f3937491ab@toxicpanda.com
Resent-Date: Tue, 21 Jan 2020 14:18:09 +0000 (UTC)

On 1/21/20 7:48 AM, Sun Ke wrote:
> When kzalloc fail, may cause trying to destroy the
> workqueue from inside the workqueue.
> 
> If num_connections is m (2 < m), and NO.1 ~ NO.n
> (1 < n < m) kzalloc are successful. The NO.(n + 1)
> failed. Then, nbd_start_device will return ENOMEM
> to nbd_start_device_ioctl, and nbd_start_device_ioctl
> will return immediately without running flush_workqueue.
> However, we still have n recv threads. If nbd_release
> run first, recv threads may have to drop the last
> config_refs and try to destroy the workqueue from
> inside the workqueue.
> 
> To fix it, add a flush_workqueue in nbd_start_device.
> 
> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   drivers/block/nbd.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b4607dd96185..dd1f8c2c6169 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1264,7 +1264,12 @@ static int nbd_start_device(struct nbd_device *nbd)
>   
>   		args = kzalloc(sizeof(*args), GFP_KERNEL);
>   		if (!args) {
> -			sock_shutdown(nbd);
> +			if (i == 0)
> +				sock_shutdown(nbd);
> +			else {
> +				sock_shutdown(nbd);
> +				flush_workqueue(nbd->recv_workq);
> +			}

Just for readability sake why don't we just flush_workqueue() unconditionally, 
and add a comment so we know why in the future.  Thanks,

Josef

