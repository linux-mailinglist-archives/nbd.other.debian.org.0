Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147A93C96B
	for <lists+nbd@lfdr.de>; Thu, 25 Jul 2024 22:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0156520D91; Thu, 25 Jul 2024 20:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 25 20:18:09 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9A5D520D58
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jul 2024 20:00:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qo61tDX5DjYa for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jul 2024 20:00:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3879120D42
	for <nbd@other.debian.org>; Thu, 25 Jul 2024 19:59:56 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-81f8ac6b908so1991739f.1
        for <nbd@other.debian.org>; Thu, 25 Jul 2024 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1721937593; x=1722542393; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XgXgmEtMXg4oQLwkxOMS2HSqq9McBzQIGAGBjn5i0o=;
        b=Aqg3hg8d1XaLfO4c7R6hGCTiO04mPuI7Zs8i/orSrepSewayf52iBbvkxl2sWPnFRr
         laCEU8yL4kj1izKzjpieXV5H4hyB3HwGoL1ynuSFpzmuAqp5lmH4fP8n5ouC7XMpRtiO
         O+wg6ka501zpe1J9g5JozU8gYItUv/7t9d1DyJK2ba1nYK0aSXM6mrxSDAt3GeQ9lHW8
         yFntVFXjw6IaqUXtmCgB3iauUwcXuN7zKEMyZI/4Bc4X/rZGSbkuPC+YvEKeYe/WjB+F
         BiWSH5rg0IvUHvKypwNxkcrAGiCSFBiUHc9TbZI28jfB5Jz1r7Y67JXYMHeJ2glPXRZA
         64UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721937593; x=1722542393;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XgXgmEtMXg4oQLwkxOMS2HSqq9McBzQIGAGBjn5i0o=;
        b=BwRadgbCPrQeoTYVq1K91T2jHsixTlRLCVcWGktpuZCNluXrb6UfeeDmmKOf5DI15D
         A/K5A7Cy4DVawP+HziHWfEXjTRufpbDViovZ0o8eg/loQ7NVFf6MO1IiH5xC4Oj7z716
         8QEo1qlTjl3PgmdOcNnYQVZbeCDSJXLi/TogdrJ4mCTJSz/yoLH5o0GrnD/ZhbfP6JiQ
         9pJZ7eXs6TDHtOnsn/gg2q7lKHF0rA8yspVWlFy6ZZ8ThaaBciMnC66xbuZ65qVlaZuk
         UjcR7lx/iTCoCza3kcyw/DYq/OtcmCN4okRxM0mzYB9V33iqKHE4abzSR1tHgq2K0fGa
         1cLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT3JzA4JTAPD7TTSifC3p0MdbIItBfqcM5eNAXmqsRQ97UHZmbepfGHi7YU/3izW8PYjo=@other.debian.org
X-Gm-Message-State: AOJu0YzsYm3xj3l7WXi14W48bXDB4mZXEEtTQ9V9oqtwkCqDnJYTcpDk
	ifZkNQOuMHm+Roq9FymfcqdkUPZ432u85DJlmzKC7tn+r0NtNvPXag/1RfjfrfBJgAjmmTibSTW
	S
X-Google-Smtp-Source: AGHT+IF+lE4LX6x0dgB+LLPvr0TYy3W68X/rGR/pknwS8jlOUdzMZKOI1TdeSmQVEohLB0xExWkSHg==
X-Received: by 2002:a92:c54a:0:b0:38e:cdf9:601c with SMTP id e9e14a558f8ab-39a22d4c4bamr24209705ab.5.1721937593023;
        Thu, 25 Jul 2024 12:59:53 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39a231070d3sm8533405ab.84.2024.07.25.12.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 12:59:52 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Wouter Verhelst <w@uter.be>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240725164536.1275851-1-w@uter.be>
References: <20240725164536.1275851-1-w@uter.be>
Subject: Re: [PATCH] nbd: add support for rotational devices
Message-Id: <172193759229.89672.9311368505409768084.b4-ty@kernel.dk>
Date: Thu, 25 Jul 2024 13:59:52 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IVTY46bR-m.A.Lx0G.BMromB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3106
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/172193759229.89672.9311368505409768084.b4-ty@kernel.dk
Resent-Date: Thu, 25 Jul 2024 20:18:10 +0000 (UTC)


On Thu, 25 Jul 2024 18:45:36 +0200, Wouter Verhelst wrote:
> The NBD protocol defines the flag NBD_FLAG_ROTATIONAL to flag that the
> export in use should be treated as a rotational device.
> 
> Add support for that flag to the kernel driver.
> 
> 

Applied, thanks!

[1/1] nbd: add support for rotational devices
      commit: 45c7d3321b0ce575705bb62b6069efad48a51d67

Best regards,
-- 
Jens Axboe



