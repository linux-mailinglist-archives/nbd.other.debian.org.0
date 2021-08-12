Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BE3EA299
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 12:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A4A7203A8; Thu, 12 Aug 2021 10:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 10:00:10 2021
Old-Return-Path: <paskripkin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0AFE620391
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 09:42:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NMt2P3AN_fbV for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 09:42:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 59CBB2038E
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 09:42:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c24so12290253lfi.11
        for <nbd@other.debian.org>; Thu, 12 Aug 2021 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tf7xAURtCOwH3Y40n33NRhchLFsigaBEgUnQpYCj/rY=;
        b=gnxWP2cSKbYc7CdxPIKzIgjKo+RRNKvcCjbopRTkJP0SADoOhtkyugvYoiYsH2H10Y
         pE0YHZ9sTJJxDDZjtIqjTy4jAwY29laRQpDPs3RwedNRIbeOBepXzNjfmaQBot3QW//e
         5gBHcqYwUI9RGRK/UN0VqMJQaqGQQiM7DYyWPFDuFl/4MZhUo/b5q9kI75T3LDkklTs2
         HdiBjHYe91xnSYo5BAyDCP0vCso5Jyy6b3r0TcDq5e/1EX8+ivzlEpbdmNwWJ6Zxd6qN
         9b8Hxpdbi5WC8h+AX3OGaAF4Lyl9Rf9hHQqRR49H8NWs7CrzdWx83SSrhSnJc85vZbe/
         9GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tf7xAURtCOwH3Y40n33NRhchLFsigaBEgUnQpYCj/rY=;
        b=kDK2Fq+qCZKuVXSXy2uARpKd07pNuM9tSGhEK3caY/+M5AetrQf99ba3MI46zPvG6a
         1dU3yJQDRIMgEgr4OiBh9UZIhz8YVX+U4G/vBPwLMACaLne7o35xr1+3SDRic5TUKUnG
         R2l3OUvjDEWDZOQnCXZVpyWDiJEjoOmt4mH6RPPvKVX5MUckn7dqYzuIGhfM7vbpfp/L
         B/q5XgyPD8DepInofStbmqiZP1tHVrX6y2MncAZWKD7lW2BMnBWjxya+p+CbWccjzKvD
         dfCpoCjLqNFxV6ILudP9FeeDU5twyWh6Aktg57oOHCZrzt1fVo6RwlImdqdDvtXa+RJz
         Swgw==
X-Gm-Message-State: AOAM531b/4uufKPr3VjyPRoKvoFsMEWriYwZuqUe8d4W94vHtPmuED4v
	4d5893+1LHcBuuPyIibPI7c=
X-Google-Smtp-Source: ABdhPJw3jwErXtsvDnYk1DOVEeUprNfJXKo6pGk3DyUdQRCE+F0Fzxqr31bUQbaznCPC7K30LKTokQ==
X-Received: by 2002:a19:5e0e:: with SMTP id s14mr1991995lfb.534.1628761359660;
        Thu, 12 Aug 2021 02:42:39 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.232])
        by smtp.gmail.com with ESMTPSA id e21sm223581lfq.240.2021.08.12.02.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 02:42:39 -0700 (PDT)
Subject: Re: [PATCH] block: nbd: add sanity check for first_minor
To: josef@toxicpanda.com, axboe@kernel.dk
Cc: hch@lst.de, linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org,
 syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
References: <20210812091501.22648-1-paskripkin@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <7f9a6877-12d9-0177-d09a-6522e5a557ec@gmail.com>
Date: Thu, 12 Aug 2021 12:42:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812091501.22648-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CKdVBCLRgkO.A.OeH.qEPFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1275
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7f9a6877-12d9-0177-d09a-6522e5a557ec@gmail.com
Resent-Date: Thu, 12 Aug 2021 10:00:11 +0000 (UTC)

On 8/12/21 12:15 PM, Pavel Skripkin wrote:
> Syzbot hit WARNING in internal_create_group(). The problem was in
> too big disk->first_minor.
> 
> disk->first_minor is initialized by value, which comes from userspace
> and there wasn't any sanity checks about value correctness. It can cause
> duplicate creation of sysfs files/links, because disk->first_minor will
> be passed to MKDEV() which causes truncation to byte. Since maximum
> minor value is 0xff, let's check if first_minor is correct minor number.
> 
> NOTE: the root case of the reported warning was in wrong error handling
> in register_disk(), but we can avoid passing knowingly wrong values to
> sysfs API, because sysfs error messages can confuse users. For example:
> user passed 1048576 as index, but sysfs complains about duplicate
> creation of /dev/block/43:0. It's not obvious how 1048576 becomes 0.
> Log and reproducer for above example can be found on syzkaller bug
> report page.
> 
> Link: https://syzkaller.appspot.com/bug?id=03c2ae9146416edf811958d5fd7acfab75b143d1
> Fixes: b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")
> Reported-by: syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>   drivers/block/nbd.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c38317979f74..600e9bab5d43 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1725,7 +1725,17 @@ static int nbd_dev_add(int index)
>   	refcount_set(&nbd->refs, 1);
>   	INIT_LIST_HEAD(&nbd->list);
>   	disk->major = NBD_MAJOR;
> +
> +	/* Too big first_minor can cause duplicate creation of
> +	 * sysfs files/links, since first_minor will be truncated to
> +	 * byte in __device_add_disk().
> +	 */
>   	disk->first_minor = index << part_shift;
> +	if (disk->first_minor > 0xff) {
> +		err = -EINVAL;
> +		goto out_free_idr;
> +	}
> +
>   	disk->minors = 1 << part_shift;
>   	disk->fops = &nbd_fops;
>   	disk->private_data = nbd;
> 

Fun thing: I got a reply to this email from
nsd-public@police.gov.hk, which is Hong Kong Police office email. Does 
anyone know what is going on? :) It's a bit scary...



With regards,
Pavel Skripkin

