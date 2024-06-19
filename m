Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68290F0E0
	for <lists+nbd@lfdr.de>; Wed, 19 Jun 2024 16:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9B1D208CC; Wed, 19 Jun 2024 14:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 19 14:39:09 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4CFF52085D
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Jun 2024 14:21:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BskYsUMxbCmT for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Jun 2024 14:21:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pg1-x52f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6E02920838
	for <nbd@other.debian.org>; Wed, 19 Jun 2024 14:21:22 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-6f799fc5af3so329113a12.3
        for <nbd@other.debian.org>; Wed, 19 Jun 2024 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718806878; x=1719411678; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
        b=xg3gvMkrzvwEKsGgP/A+x8t+xEDOY+gzkBVfql+CeQQjn59L74B8Fr10/GE74/UokK
         bylmphoW+KaAXVZi9MUfMTuvETGD+mZhXzRmOM7ifb5bKL6pnhtRLAeccYzr1KSQrTQc
         Dz7sLA8TilT7GXsU24Lg4udKvh71/8bNLeF9UWTn36GLz0BCJcGyIcWgUGDyMi0VEnOu
         9i3b5BlamPdTDhQfWlRMV2dpXf7BiDEyHdBzTcA8JVnhUxOv8tag6dHE7ckopBPs5+EA
         SRBY0rmjO6eZykezAzPedSXvCG5vzvqeAI8egqI0YfJZSune1vB/vp8Q7AdkXBWfghsd
         poMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806878; x=1719411678;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
        b=KdJCtFuxrHHBeNtaOnoWehlJ9tlikJ5hN8pGzVF6mk5wlWMVcRqPqyiG1+GnLZTzxb
         l+Qi9ydnB2PLa1lX9GhBlKAf2zw4IrjGQtqb/AWMXEWFnaNnekCVGFJHk5khNeR3/LQE
         TbPv134i6IYF8Pp6knkDfbSPsnkBLDsHCpz6O6778oZcP/j1npjkWKNFrzXTSqNRkC6j
         SHtdf0TBv/mVTYXzIC6SrwLgrLejzp9xqFpL4oBsWIMGE1/idWE1fbYjJQvIci3QQbIH
         fKjd2aYbB13Dc0wVkxgT5SypIoZstQ2ps8Wb9JZM4tEoCJEDT2JwM9ZB06PVIjelXGwA
         wAyw==
X-Forwarded-Encrypted: i=1; AJvYcCWIriXov5ijCFd13VbyduQjNocAe8/UF7mIHEdUMuouJ4HIO4KI7vxaXOtYOWUG3XIRSVaNBSkKuE7rbc4zfjiTnWjTKg==
X-Gm-Message-State: AOJu0Yw/Jz6vgeLv72W8r+EBnNc7kFH+LUFGZNibGakK3G0ndrH00wfP
	X8uhVu0/JQZ0AYvCPXomSxrkJjZXoBdi2wY4/CBO/44VZr+21pOt94/TufRR/Zo=
X-Google-Smtp-Source: AGHT+IGlNYahWungPdY/VG0D2i+/kOzAqG/9vIEbq77BhnEO6pEhdeI5ihGxkaZBKQBmSE54SEc3pA==
X-Received: by 2002:a05:6a21:33a5:b0:1b8:622a:cf7c with SMTP id adf61e73a8af0-1bcbb727134mr2697727637.3.1718806878609;
        Wed, 19 Jun 2024 07:21:18 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b110sm10739431b3a.153.2024.06.19.07.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 07:21:17 -0700 (PDT)
Message-ID: <e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk>
Date: Wed, 19 Jun 2024 08:21:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: move features flags into queue_limits v2
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240617060532.127975-1-hch@lst.de>
 <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Language: en-US
In-Reply-To: <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8R5J90zGYoJ.A.GlTG.N2ucmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3070
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk
Resent-Date: Wed, 19 Jun 2024 14:39:09 +0000 (UTC)

On 6/19/24 8:18 AM, Jens Axboe wrote:
> 
> On Mon, 17 Jun 2024 08:04:27 +0200, Christoph Hellwig wrote:
>> this is the third and last major series to convert settings to
>> queue_limits for this merge window.  After a bunch of prep patches to
>> get various drivers in shape, it moves all the queue_flags that specify
>> driver controlled features into the queue limits so that they can be
>> set atomically and are separated from the blk-mq internal flags.
>>
>> Note that I've only Cc'ed the maintainers for drivers with non-mechanical
>> changes as the Cc list is already huge.
>>
>> [...]
> 
> Applied, thanks!

Please check for-6.11/block, as I pulled in the changes to the main
block branch and that threw some merge conflicts mostly due to Damien's
changes in for-6.11/block. While fixing those up, I also came across
oddities like:

(limits->features & limits->features & BLK_FEAT_ZONED)) {

which don't make much sense and hence I changed them to

(limits->features & BLK_FEAT_ZONED)) {

-- 
Jens Axboe

