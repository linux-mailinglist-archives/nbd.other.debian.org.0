Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CB256938
	for <lists+nbd@lfdr.de>; Sat, 29 Aug 2020 19:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 01C59203B1; Sat, 29 Aug 2020 17:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 29 17:03:08 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E78FF20381
	for <lists-other-nbd@bendel.debian.org>; Sat, 29 Aug 2020 16:47:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	NICE_REPLY_A=-0.809, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X8bJPXz-iGJg for <lists-other-nbd@bendel.debian.org>;
	Sat, 29 Aug 2020 16:47:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x102c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0B63720309
	for <nbd@other.debian.org>; Sat, 29 Aug 2020 16:47:17 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id i13so977857pjv.0
        for <nbd@other.debian.org>; Sat, 29 Aug 2020 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5Rt5+Gjo0UGdPCISf5CydG1I/Z+wq56+kU1eC124qs0=;
        b=m+jv6bJZRhsllEVJr5l4EY9W/YKC3BAZMM01kcSyMJjFYDecSRzG/FmZTuCJs/t2ny
         OTZ9rLbXL2RR9XafeWT8qZMVX3EveS6Y24+PU4GHbshyYp9ee+dMK+C0YDAdbf9aKVfG
         jFqCByaqPcul+XLJJeoNuBseGgzPL/FnONYDc4Cu2YlXVbpi+Vb87s5ho1nAAniIHKh2
         KXR7ViPjwNUAJWYxoNcQWgVEZejYo15uNzb3F2nN2WGlqbFQbig7tdJIWt883ZSPHmjM
         5IySceO5HRVeWhmNoEcv3uAu5gm6m3KKHdwRHSbGF0wVoZVgzPve+VtbuXjvG8XJZ7Uy
         as5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5Rt5+Gjo0UGdPCISf5CydG1I/Z+wq56+kU1eC124qs0=;
        b=Wq1u1sGRNSksag8UAmjczg8FdNV+di5JRb9d+FfcDC+M8j4c9UPaZw/DCLlknsJWhn
         IBlngB+uqQICb8ae7vR8Q44k5WDG9SR4VTV3AQUB8fXCUr/dx6hWc+nA7PNVnI4to/HB
         M+RReYPrzw+nHybgFATocbUDp6Vluh9Gc8Eonnl0BWCIMdYbwrmP71cNBkn3AA+6E7Z4
         NV2b3Mo8GvIxGnC4wFQJRYJyKPGajyKur9lwmreP5MLXbkmPGE61HI4esCQ4PNkYw+bu
         hg+H/PZ34cRRkTDgntBJVe1zZMmNWCA1NftR7rvmQOEQUV/hF+oYZAaSTQ5MTNuj1Z+z
         cxDw==
X-Gm-Message-State: AOAM532h5DbXBbW+P2Be1rm+cwCGCeKJewDKceYV5UoQj56zvqgquNSQ
	GWANQSOYv1zSVXIM+17Ff95EEw==
X-Google-Smtp-Source: ABdhPJwh/IaT8sjJze0JR0UOlWwMhEHIvT0ikyEXE/ycXPb0JRTnRL4uDSst200BKNS1envrwdz+3g==
X-Received: by 2002:a17:90a:c917:: with SMTP id v23mr3622499pjt.97.1598719634004;
        Sat, 29 Aug 2020 09:47:14 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id w82sm3114901pfc.183.2020.08.29.09.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2020 09:47:13 -0700 (PDT)
Subject: Re: fix block device size update serialization v2
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Xianting Tian <xianting_tian@126.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20200823091043.2600261-1-hch@lst.de>
 <20200827074758.GA8009@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b1960016-c265-1e1d-cfd7-de2330bc5eac@kernel.dk>
Date: Sat, 29 Aug 2020 10:47:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827074758.GA8009@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a6NRBx970x.A.PaB.MpoSfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/960
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b1960016-c265-1e1d-cfd7-de2330bc5eac@kernel.dk
Resent-Date: Sat, 29 Aug 2020 17:03:09 +0000 (UTC)

On 8/27/20 1:47 AM, Christoph Hellwig wrote:
> Jens, can you consider this for 5.9?  It reliably fixes the reported
> hangs with nvme hotremoval that we've had for a few releases.

I've queued this up for 5.10. I think it's too late for 5.9 at this
point, and it's not a regression in this release.

-- 
Jens Axboe

