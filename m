Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D776BC4EB48
	for <lists+nbd@lfdr.de>; Tue, 11 Nov 2025 16:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B0B33204DF; Tue, 11 Nov 2025 15:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 11 15:12:09 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B479220474
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Nov 2025 14:55:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 44iPuW40kSkE for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Nov 2025 14:55:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0B36D20462
	for <nbd@other.debian.org>; Tue, 11 Nov 2025 14:55:07 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-9486adc1aa9so168157439f.1
        for <nbd@other.debian.org>; Tue, 11 Nov 2025 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1762872904; x=1763477704; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd60/KfMSWtIeVZjWzA7tGiHeUAva3B/1z//rOpfIQw=;
        b=JXsE7+JNbrCBFRInaFSTkGRLXn5o76nxqaO7NVGR0MKkiV55bQYqGMUnQShIBLxfFx
         MKVJR655NZfMFE/a8Qtf8jBiKgVG6iiN7aIVY/kkq5U7lTk5r1oK8p/HK5fiRxbSTALx
         O5nTWqnHJo6FhA8TXzYnrH4H79IlT6LSq1FzMeZF/NChJ5+gcHH9WXOmlYDMEIaYtBIO
         eb9d85Wc/ZIPbmO72/CT43aBoOzUowyEdTffcXXC/oLxumubnXEOgPgDSEWvgTNewSKH
         woN7p7N4fUuIvXk5MYPwgKuXuLJsfTcKGQjfSGXLP5r6KfR5Lq3EXYZeiYyiKlqNzzgR
         npDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872904; x=1763477704;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vd60/KfMSWtIeVZjWzA7tGiHeUAva3B/1z//rOpfIQw=;
        b=lKzpvH3vskMZL0OVSb5TUCmxd/iRmOmfeo/CE/3DsWlz4nSOSUnKD59L4mdGOpBhvY
         DZ8RfRQlJ+nSouBh+4bVTxviZdrqAhBthApdUn5U2xkkfjSslCPihZigWCsT9bA31EFz
         NF8eIvrCYbxM5t6l1ob//e6jfUUfOxT+QiZy1yvYWGByrmAehX295bsXKvLB9RpILh3L
         mA72QYh5NZyWXVYhaCsDMxhyJYrh6omez/SZ1VKXSY/x+l8WjhROQo5tw332/2o9rxSi
         dgELtivqYPUGtIJrl2X5tJTUZX7ujiVmOUSVB4LRljk5MrVwgzqJQlICwVoDmC1S4qC/
         ydIA==
X-Forwarded-Encrypted: i=1; AJvYcCXTbnF4z2XyPVrA+AwLYNEzY3U6WjYjTl2lkJzuaHdj8tx7DhaiHrbtpoe4nG/yWXU8YwU=@other.debian.org
X-Gm-Message-State: AOJu0YwWZnpqjdJ+7fP6831Lq30PPpfw17Hv8Zs39YPYJPCdYiXiMlo1
	htJiA0I4jr/Wx6M3HuruLcRTMnEtG9Ke0Mcy6B9NgjQT9rJ359S12uh7tn6bV4fjbLU=
X-Gm-Gg: ASbGnct03ws51ICGHXtYPcBhrZfuCb5c05LaFbziVRX0S5Y/GeQpnJKQB1IqcOGtfVo
	ILepyyag/8BxfvmArhGHlbtyH4jQjINkI5/8K3zJwpJ607/OOKbfrpAbKLd6NuEeXvMGbI6Rd9n
	cIWlvCsgRJUlJnxkQQDM/ZZat2Akmwi098B5mz8Bw7K9TkFWx1APEkFq226H1d1PP3YfslF1Fq2
	QHjkurzWj91kkgBKz7iO97IsvsalU1Ik04hth5XhGKl2X6XZUO3ICLWyrppLvwEA0dI3oCarJl2
	orHX0UpUxsu3AoaIhUCnTrWVTRFnAgsM8F/k9aRUeWrgYfeBB7GZdFS0eqbt0MG9s3izbDdOKd2
	keO6P3+PJjDJNoyDWePqykaD816fXPyTX+3eW3alRA1Ve4vt+HKU0mGywNPiY8UChmyEUWLNyd/
	WBMmw=
X-Google-Smtp-Source: AGHT+IFMYYVFn/FWFoI4cBgTrfFiY+nGqvc8CTHosZF05Ixu1TUPMtPgPExq2cQbx0wbLmmkWOTIQQ==
X-Received: by 2002:a05:6e02:17ca:b0:433:5a9d:dac6 with SMTP id e9e14a558f8ab-43367e7166fmr180713905ab.27.1762872904081;
        Tue, 11 Nov 2025 06:55:04 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43380302872sm26311045ab.32.2025.11.11.06.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:55:03 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Zheng Qixing <zhengqixing@huaweicloud.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
 houtao1@huawei.com, zhengqixing@huawei.com
In-Reply-To: <20251110124920.1333561-1-zhengqixing@huaweicloud.com>
References: <20251110124920.1333561-1-zhengqixing@huaweicloud.com>
Subject: Re: [PATCH] nbd: defer config unlock in nbd_genl_connect
Message-Id: <176287290263.173215.8003110522218932458.b4-ty@kernel.dk>
Date: Tue, 11 Nov 2025 07:55:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XbUK3Yf0VvE.A.28KD.JJ1EpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3472
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/176287290263.173215.8003110522218932458.b4-ty@kernel.dk
Resent-Date: Tue, 11 Nov 2025 15:12:09 +0000 (UTC)


On Mon, 10 Nov 2025 20:49:20 +0800, Zheng Qixing wrote:
> There is one use-after-free warning when running NBD_CMD_CONNECT and
> NBD_CLEAR_SOCK:
> 
> nbd_genl_connect
>   nbd_alloc_and_init_config // config_refs=1
>   nbd_start_device // config_refs=2
>   set NBD_RT_HAS_CONFIG_REF			open nbd // config_refs=3
>   recv_work done // config_refs=2
> 						NBD_CLEAR_SOCK // config_refs=1
> 						close nbd // config_refs=0
>   refcount_inc -> uaf
> 
> [...]

Applied, thanks!

[1/1] nbd: defer config unlock in nbd_genl_connect
      commit: 1649714b930f9ea6233ce0810ba885999da3b5d4

Best regards,
-- 
Jens Axboe



