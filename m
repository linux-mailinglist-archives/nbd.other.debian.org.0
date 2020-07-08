Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4D2192FE
	for <lists+nbd@lfdr.de>; Thu,  9 Jul 2020 00:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0C20F20205; Wed,  8 Jul 2020 22:00:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  8 22:00:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E43E4201C4
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jul 2020 21:42:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ete3b8CsqvQm for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jul 2020 21:42:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1042.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A74152017A
	for <nbd@other.debian.org>; Wed,  8 Jul 2020 21:42:41 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id t15so134734pjq.5
        for <nbd@other.debian.org>; Wed, 08 Jul 2020 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LDdlqqViKy4NCWMYpbRbkVG8WrQZL6OuDPANlMIK/JI=;
        b=18LQyLoTvbAC6GnFTcC6drJgLAXGofZzdiN1mbx2ijUEH3DQWigQ64u0JpQJPOMEBT
         eumfGnUTryqlWU5Uwm0nweGFiTB3BrRTxALHN20vcmzaI4EY0vDbBCcjo8hdHL6julph
         dDF7O+Tzxqr26YIv/q2nDWRhjYjvH6SN7Bzx0AI+UOhpczQBbIAbkZ5SXsnjpzuB8w0i
         eAKAWXeSKeBTbAKQoUg1PgKDRXHg3hIRsA6UR/+DBidPV1mk31BeQWnA8yV9a4K09r8X
         1gUJlzZtKgfrg/eZeo0+STc9uJX7ku1z/pVfQCGTZ+NVAbhqHiTwIRTJeQ8dNa5oATQ/
         xpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LDdlqqViKy4NCWMYpbRbkVG8WrQZL6OuDPANlMIK/JI=;
        b=O5EFyG+XU6rXbrJN+7761wlntaQGUl37G7G6jpfaow1ewf9y3Ypw797IbrKbXg73Vj
         O16CmzWfUvBGDoULu/HjrnrBLbMipXf055oQfYE8grcgTYUeSBTxwBIA+7LWtIBhYCXm
         rZBrOXrRoc55Z3zK6suLgAsBNbHw86LMC8hjwqZFNuD2dTfBkg4zkIZ5g1xvT5DTFJAw
         TRzDPqm3G823vSV8KA1J9aR0PfvLZYW1mEt0m3RayzSSAEf3i52oUUxpHdfJwYu0D5ak
         lrs3Nfc5RA0Y8QZ3yZEaRBMnrDfvjoJoDnyasyRR3XYb6DnIHitD5rrH7+FoNG9tyf0e
         f4zQ==
X-Gm-Message-State: AOAM5315DCf3UcartovAPVRTceBqWvGH5RyoNdGx4GpvPkONOcwxrPxA
	r06JS7kNg+PchFLepXOQIssceA==
X-Google-Smtp-Source: ABdhPJz+O253nBtbQqfn85QqkbS32yMg4aWObX7KPy12N7UoJG4AJ3rXkgeNIooTOrDqHQ0PS3LAAg==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr11731466pja.180.1594244557753;
        Wed, 08 Jul 2020 14:42:37 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id 207sm663258pfa.100.2020.07.08.14.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:42:37 -0700 (PDT)
Subject: Re: [PATCH v4] nbd: Fix memory leak in nbd_add_socket
To: Zheng Bin <zhengbin13@huawei.com>, mchristi@redhat.com,
 ebiggers@kernel.org, josef@toxicpanda.com, navid.emamdoost@gmail.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: yi.zhang@huawei.com
References: <20200629012349.26641-1-zhengbin13@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5a7597c2-2d51-8382-5b60-73cd39e55fda@kernel.dk>
Date: Wed, 8 Jul 2020 15:42:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200629012349.26641-1-zhengbin13@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r6jcHGue4JD.A.oxF.oHkBfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/916
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5a7597c2-2d51-8382-5b60-73cd39e55fda@kernel.dk
Resent-Date: Wed,  8 Jul 2020 22:00:09 +0000 (UTC)

On 6/28/20 7:23 PM, Zheng Bin wrote:
> When adding first socket to nbd, if nsock's allocation failed, the data
> structure member "config->socks" was reallocated, but the data structure
> member "config->num_connections" was not updated. A memory leak will occur
> then because the function "nbd_config_put" will free "config->socks" only
> when "config->num_connections" is not zero.

Applied, thanks.

-- 
Jens Axboe

