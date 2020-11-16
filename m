Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 809332B4A18
	for <lists+nbd@lfdr.de>; Mon, 16 Nov 2020 16:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7036F20257; Mon, 16 Nov 2020 15:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 16 15:57:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CF1C320201
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Nov 2020 15:40:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.999 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BYw5fpA-zuKO for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Nov 2020 15:40:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd29.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 47F2B20350
	for <nbd@other.debian.org>; Mon, 16 Nov 2020 15:40:15 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id n129so17833023iod.5
        for <nbd@other.debian.org>; Mon, 16 Nov 2020 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
        b=vJHuCgkLtyaYNtKWJGKWTC2HAaX7Y9m8y1VpqDKgvUWa8d0I51VY3ALJeXJtOlsGpr
         QzxZZWfSIBe9Z9YJVgCkUF04iuHI0uFspV4JwGcoTFtYktgjnY7A8CRm243mremkxSFW
         /W8ZuC0hXxmoHn+ezTFvYhGe2XU1ttQu6xlHRIQZSFb9V/9nguKyH01uIZBsQIBla1sm
         kSpCVk0QJdWteogX0XEWe3MJV6jr1Lh++tWh99mrFKS4zYsaeRBflt08zg4X1OBFoLaD
         OZKwfBprL/CxXZIUp5e8ounGHLLXOFSswyyzQU1smV5YfKh+taZ0KanaNv47asHmejvk
         eLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
        b=uSpm+i1/cJReomdqNdQBWrAgbThS1zF/7qBvpljF8p21jTSbkL7mlzXYMgL3SV3GTA
         Jfu5YRFCm6yndG/JOLbHMOBbEDSUjUR/U6iyn8QhuPnTktKgcVRA27sHAwhnUeasm8DZ
         MWH5L+t3jjKWk8AfxuQKrGc46UXkI3UM50LSv+I6x5NswrfyVewQ5hc7MtpQbiYi6Vho
         yb8AjNnk0VxGmEBGHgoPZz3q2qvoikiJx0Q+M2iGe0HKgLnAi+VPjNf0XRprCMFO3fLr
         smeeomNrcvrnadNHcvyY5zIp3gF+5vW9gPPP/wl5jutyDyqrtRKJHRmXh6BDfCt4vuSJ
         SVDg==
X-Gm-Message-State: AOAM530pneEvWCQHjvBoYsuZQevQOR1Caf34IQ4DDIdiVVzQlk/KpXFL
	cHiYnaBuEk+1DubcBcsQsbc9Sw==
X-Google-Smtp-Source: ABdhPJzORiPywjBgXN2NzytHbmvXHQyepXDfzUWSZfRzXJXzcmliMaw8xrhzAaFsEhdxvHHHShuK7g==
X-Received: by 2002:a5e:9e0b:: with SMTP id i11mr3534187ioq.33.1605541212314;
        Mon, 16 Nov 2020 07:40:12 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id i82sm10491839ill.84.2020.11.16.07.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 07:40:11 -0800 (PST)
Subject: Re: cleanup updating the size of block devices v3
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <506876ff-65b0-7610-6f9e-8228fcd201c8@kernel.dk>
Date: Mon, 16 Nov 2020 08:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UKP4HVfhrxE.A.XPB.VFqsfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1070
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/506876ff-65b0-7610-6f9e-8228fcd201c8@kernel.dk
Resent-Date: Mon, 16 Nov 2020 15:57:09 +0000 (UTC)

On 11/16/20 7:56 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series builds on top of the work that went into the last merge window,
> and make sure we have a single coherent interfac for updating the size of a
> block device.
> 
> Changes since v2:
>  - rebased to the set_capacity_revalidate_and_notify in mainline
>  - keep the loop_set_size function
>  - fix two mixed up acks

Applied 1-23 for 5.11, thanks.

-- 
Jens Axboe

