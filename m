Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E429626F8F5
	for <lists+nbd@lfdr.de>; Fri, 18 Sep 2020 11:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFC5F20565; Fri, 18 Sep 2020 09:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep 18 09:09:08 2020
Old-Return-Path: <sergei.shtylyov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1110220517
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Sep 2020 08:53:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.209 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aAIjiV2k6NlH for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Sep 2020 08:53:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D837320504
	for <nbd@other.debian.org>; Fri, 18 Sep 2020 08:52:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r24so4437249ljm.3
        for <nbd@other.debian.org>; Fri, 18 Sep 2020 01:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=asjClMEVQUugwRnuiCaRpILyUTB6qCyLua353zU0XaA=;
        b=W/z/lqMIRm38/rH5hoC1y6v6zRQO1N/LODV5dyUEiJu3Z0Ysqlp/3+8L1e9rLDMk2m
         sBItJh8qIyGYm03eIK0hTdBoxXVBw4cghdDiPSwhWAZoWgfzs33gNea15pJClLwx2PyP
         hHZXDHkjh03U3WZVcKBTqEHufGASOVouVB4m7BE5RIoKEh2joN3kIYcDTDJq0Chrbk2i
         J/NdgDEshJe1yWvUgaAnM4jfYus4kL1oPcAFg4fuHOSe5l7mwswJJ6COScNBGhNcGGPN
         q/gR4vXJlWd2ZXlKnLgsRNsC12UFA86our5/zZc8O5yxXBZ6W0BJN8M0aPB9fejtttXs
         Ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=asjClMEVQUugwRnuiCaRpILyUTB6qCyLua353zU0XaA=;
        b=s6adf6fupnSmMsW63Q/W8GtQc/FyPkFjApSKc5UawDe306geeUn8RLK60eNUVKZVYb
         /wiYFj0Mx2C/wJMaewRQRiT4nlfwtq7T6fISPfydJkeF5i0H4Xo7cnk4VWBnSqWt9Fzz
         1y48it80ee/Ebaitl8cn+3yo4HYl4wo0H03pkQ3FG+UYGNdJuZGByfggH7J+vj4bfl3P
         dwJrH1pKAnMCDZ7vkOTEwuZ2mUBQ4kUVj1FKOr/AngrOYDzz3mbGFxAg2KrIAaFfHf8O
         q+THInU1aU+E46Y7x7kJ4wicN/dGTCbuT7X01Th8P84Ogz1YFckS14NVyK6p/QABDcdI
         hHQA==
X-Gm-Message-State: AOAM532MpDmr1Lsr+7c9w8xrCIeeL4Di3UyvlugE5IL2yOPBAZryIOUD
	cID+md41UWMyIJmOQNhWjpA=
X-Google-Smtp-Source: ABdhPJy1RlFuj0xDkan2bS2ZV4OPmRHWdA9YyD0WopBAfX+NGu2O9O4BkfmuLbcTQkb9zURbzOO0Aw==
X-Received: by 2002:a2e:a48c:: with SMTP id h12mr12544381lji.221.1600419176113;
        Fri, 18 Sep 2020 01:52:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44fb:767f:35b0:3244:6cdc:c4a2? ([2a00:1fa0:44fb:767f:35b0:3244:6cdc:c4a2])
        by smtp.gmail.com with ESMTPSA id u1sm459692lfu.24.2020.09.18.01.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 01:52:55 -0700 (PDT)
Subject: Re: [PATCH 02/14] block: switch register_disk to use
 blkdev_get_by_dev
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-ide@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, linux-block@vger.kernel.org
References: <20200917165720.3285256-1-hch@lst.de>
 <20200917165720.3285256-3-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <091931b1-eb9c-e45e-c9e8-501554618508@gmail.com>
Date: Fri, 18 Sep 2020 11:52:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917165720.3285256-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <egXOnVnl9YM.A.fyB.0kHZfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/982
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/091931b1-eb9c-e45e-c9e8-501554618508@gmail.com
Resent-Date: Fri, 18 Sep 2020 09:09:08 +0000 (UTC)

Hello!

On 17.09.2020 19:57, Christoph Hellwig wrote:

> Use blkdev_get_by_dev instead of open coding it using bdget_disk +
> blkdev_get.

    I don't see where you are removing bdget_disk() call (situated just before
the below code?)...

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/genhd.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 7b56203c90a303..f778716fac6cde 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -732,10 +732,9 @@ static void register_disk(struct device *parent, struct gendisk *disk,
>   		goto exit;
>   
>   	set_bit(GD_NEED_PART_SCAN, &disk->state);
> -	err = blkdev_get(bdev, FMODE_READ, NULL);
> -	if (err < 0)
> -		goto exit;
> -	blkdev_put(bdev, FMODE_READ);
> +	bdev = blkdev_get_by_dev(disk_devt(disk), FMODE_READ, NULL);
> +	if (!IS_ERR(bdev))
> +		blkdev_put(bdev, FMODE_READ);
>   
>   exit:
>   	/* announce disk after possible partitions are created */

MBR, Sergei

