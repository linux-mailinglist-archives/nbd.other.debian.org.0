Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8A94A985
	for <lists+nbd@lfdr.de>; Wed,  7 Aug 2024 16:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BA5F820580; Wed,  7 Aug 2024 14:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug  7 14:12:09 2024
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C242320547
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Aug 2024 13:56:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9e7w3sAVE5en for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Aug 2024 13:56:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-ua1-x932.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 114E820540
	for <nbd@other.debian.org>; Wed,  7 Aug 2024 13:56:40 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-823227e7572so612322241.1
        for <nbd@other.debian.org>; Wed, 07 Aug 2024 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1723038997; x=1723643797; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuS59JADbTnnYXSWbhEozGqiA0xSa9BLnZ7t90LFaxE=;
        b=kJNzXap1KaEsUMKpdmoDcmmioVbHeq/1ZKdHZhM1VDBvv/vRb49VU2cFiFQ9637xP5
         m/sanPv1Az1Ygot9LLxCLOF/QAjtCuNOEwfGFDXdeuy6GgUktZyhG+hCOCb6cUn1vovy
         uW6rKDsOl44doZ/DHyZSIoLAySnMltnkB5otvXccUVCWKbF6EBT2rtFS74/ketVIVFkF
         wFy02UpSk1nTqDr7Ucqj774+KGZpTlHmWhT9OrhDpPHRLnQTkTKIuH6FlynxwUJuApoy
         4G0hwFaeMSBfqKrK+iICsAbz/I1VKCMoL4/lhq3NIUiW3lRTbBUWvvB3257R/W7GKuYJ
         l20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038997; x=1723643797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuS59JADbTnnYXSWbhEozGqiA0xSa9BLnZ7t90LFaxE=;
        b=AGieb/XhkBe/pMTNzTHdAFz1c3FZzLwAMPzgNVU9P6XXtHy2MOku0CZ0CSbdr+FZxg
         WM1sXXl0m8ECy48HnxdbsyJZeN0dBtvSzdlOSUx/LNjvvasU4XtPwePGI0s9HT3i4eXA
         tskDNPu/ZeC2xxlHMaTB8+F3756h9IqltAiOvLFpN8M7gqECBX7gzw+qkLyDcizYvWBq
         tgoWg2C0f34OmmhBMW4WWH886sHLbsGkWHe+u+8S8PytG311vdnnJfFhaUexZ7kPQCrH
         xz4tNg+trwxqjbwzlpjAUYP4AgaJ8iK79nQLPO6tH+lXYP40JZQAArgqWcBV+6/3PUyJ
         e80A==
X-Forwarded-Encrypted: i=1; AJvYcCVu+V5TTqCIHtOOifHELY02cYfjSH7mbayInLrYdYkr7MCuj9O/E2NmA9YDl+pRsLcFivbSj9U6Gidz02vtNadYdzQQDw==
X-Gm-Message-State: AOJu0Ywnu1OmmzZD4GrDzUklMq7te9H0Z2Wb5xuQrr/8koNRR2gyzaUg
	sIRSuw2SDttHevsWLRmToFwzfzlU6UjG3fKLH93W24Q0iVJuyE9yVpxOo4Y5MBFfRJNfXo9d1A1
	p
X-Google-Smtp-Source: AGHT+IEOWFTdrwiZrbHViifiqbdv+xNaB1znBNizFfr4dGmtnW/qOKfBByKDT2UtyQKnBsMQ2WkouQ==
X-Received: by 2002:a05:622a:4cc4:b0:446:5c58:805d with SMTP id d75a77b69052e-451c79d46dfmr52220451cf.19.1723038986722;
        Wed, 07 Aug 2024 06:56:26 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c870066csm5157471cf.4.2024.08.07.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:56:26 -0700 (PDT)
Date: Wed, 7 Aug 2024 09:56:25 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Wouter Verhelst <w@uter.be>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] nbd: correct the maximum value for discard sectors
Message-ID: <20240807135625.GA242945@perftesting>
References: <20240803130432.5952-1-w@uter.be>
 <20240806133058.268058-1-w@uter.be>
 <20240806133058.268058-3-w@uter.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806133058.268058-3-w@uter.be>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kWP2e1IFUnN.A.pDHB.5C4smB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3125
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240807135625.GA242945@perftesting
Resent-Date: Wed,  7 Aug 2024 14:12:09 +0000 (UTC)

On Tue, Aug 06, 2024 at 03:30:56PM +0200, Wouter Verhelst wrote:
> The version of the NBD protocol implemented by the kernel driver
> currently has a 32 bit field for length values. As the NBD protocol uses
> bytes as a unit of length, length values larger than 2^32 bytes cannot
> be expressed.
> 
> Update the max_hw_discard_sectors field to match that.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46
> ---
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 20e9f9fdeaae..1457f0c8a4a4 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -339,7 +339,7 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>  
>  	lim = queue_limits_start_update(nbd->disk->queue);
>  	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
> -		lim.max_hw_discard_sectors = UINT_MAX;
> +		lim.max_hw_discard_sectors = UINT_MAX / blksize;

We use 512 as the "sectors" measurement throughout the block layer, so our limit
is actually

UINT32_MAX >> 9

since we can only send at most UINT32_MAX as our length.  Fix it to be that for
both patches and you should be good.  Thanks,

Josef

