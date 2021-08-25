Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D83F7D3D
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 22:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75B542095D; Wed, 25 Aug 2021 20:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 20:39:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 984CB2095B
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 20:21:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.285 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AOVVq51gMsK9 for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 20:21:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 49B5B2095D
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 20:21:37 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id j18so634484ioj.8
        for <nbd@other.debian.org>; Wed, 25 Aug 2021 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ByOyhUtWzhjBtqjAbMyRHnsC1XBkJmGibznOhFVodjQ=;
        b=STLwbNOvBUT6OElfx0MMqOzLc0Z6e+Juz3Hl/SNRMclDeB9hR5HFzteUgDzZnvTOFN
         PXkVBV0oT9WFHp0cXs0FjOzkpDjsF/8c3ywsHGdHL/Cey90by8DFxNboPlc7J1OUP4Oq
         zGYv4we0JFR9jRgKtIVQMRqZTP+ZSMf9m/iQfoG+zoaF9bRAzohjlL1Seiug5e9fv7ci
         CJY+sAcxXTeEPhRBxsrt3IGrNJadmVZhLRKd4m31sumqgBnBY6bGV14zpW6HryMJCN7Z
         /OOCH93uMMZA/Ls+nEMpvitRfcXHL6QETvHNclFQu49h6ZtfM0ASPthfx7GtxOf217NG
         sdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ByOyhUtWzhjBtqjAbMyRHnsC1XBkJmGibznOhFVodjQ=;
        b=peYGQKb9RF8hByFpHTUp0SK35dU132CjnQ5CZ1yCFPoMJjyhnPkemKGcVid2CPdal7
         5KfM4Y5eYCQiHOTRE0BQHH6mFUUylBquQFYCBtjnZT3wk8/Xuv6jUsY0on37VARbFKKB
         goKp1BVY0fEwyFDZRyGbw8o97fZiObHMea0RQiqrz1yWtCfQokGBPBMnIcg7G6a44oYY
         KMKi0Ptzsb0m1MdN4cGmLmwLmPq/IpPJYn04ySnpWhH9EPVg4Y3gsUhZPHJyV9zdamGy
         fIIRhoExIp9sMqWQv05NLSPCMXU4qj8EFcXJiIqUjjVpHZFEl4VOPACpKRLBl3WlugQu
         X2Xg==
X-Gm-Message-State: AOAM533NxfO5dZhw0cF24U5LXpHgBXjCrfQH0TW8i1oRNcLUWDVkhMOw
	BBAdb+yGKDLCta76UsBmoiYtmg==
X-Google-Smtp-Source: ABdhPJxNdlzdOg6WtlrwB2fVEosRADluWkG9zI52EqYG7JqNy7WXrMJ5xEwAm21vG+/KxZGILvX3pg==
X-Received: by 2002:a05:6638:5ae:: with SMTP id b14mr235823jar.80.1629922893805;
        Wed, 25 Aug 2021 13:21:33 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id b16sm519399ila.1.2021.08.25.13.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 13:21:33 -0700 (PDT)
Subject: Re: nbd lifetimes fixes
To: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Xiubo Li <xiubli@redhat.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
References: <20210825163108.50713-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <aff4fedb-046d-0a91-0bf8-838a82a145c2@kernel.dk>
Date: Wed, 25 Aug 2021 14:21:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NSbOY86hKmF.A.8TF.tpqJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1338
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aff4fedb-046d-0a91-0bf8-838a82a145c2@kernel.dk
Resent-Date: Wed, 25 Aug 2021 20:39:09 +0000 (UTC)

On 8/25/21 10:31 AM, Christoph Hellwig wrote:
> Hi Josef and Jens,
> 
> this series tries to deal with the fallout of the recent lock scope
> reduction as pointed out by Tetsuo and szybot and inspired by /
> reused from the catchall patch by Tetsuo.  One big change is that
> I finally decided to kill off the ->destroy_complete scheme entirely
> because I'm pretty sure it is not needed with the various fixes and
> we can just return an error for the tiny race condition where it
> matters.  Xiubo, can you double check this with your nbd-runner
> setup?  nbd-runner itself seems pretty generic and not directly
> reproduce anything here.
> 
> Note that the syzbot reproduer still fails eventually, but in
> devtmpfsd in a way that does not look related to the loop code
> at all.

Applied, thanks.

-- 
Jens Axboe

