Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C5316BDD
	for <lists+nbd@lfdr.de>; Wed, 10 Feb 2021 17:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05D59205DA; Wed, 10 Feb 2021 16:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 10 16:57:08 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C70FC20371
	for <lists-other-nbd@bendel.debian.org>; Wed, 10 Feb 2021 16:39:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.085 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.105,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BPxTLXADUhk9 for <lists-other-nbd@bendel.debian.org>;
	Wed, 10 Feb 2021 16:39:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x134.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 410502039F
	for <nbd@other.debian.org>; Wed, 10 Feb 2021 16:39:06 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id q9so2431297ilo.1
        for <nbd@other.debian.org>; Wed, 10 Feb 2021 08:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JV4Ql9KQvz2aQzVgMYltIdHx2mjwmlHNpDGI0MR+TO4=;
        b=k8PSQF9m04mzFOs+Ko82ihv/AVrehPpQDFAx2TxGHFhAU7+EYNNE3GF5uiErDrhL84
         WYj3fDnOgadhkXP9L8L9WYVUlWt1omqEr4fqYg/IO3rSkAVRZnvvhFGPXQ779qMpX7Mx
         jykI09prfeDNI+sTGI15ImDpydSmWQhfy9SvZeuz723dOMedeHLyx4STjo0L+Ptws0r0
         gL6nOu96rOfxkoTrUKERr320ZDybsx+CQgLQJjYeuByLUq7poUXMRaP+ON+Oebe9vHNW
         FfSGRTIY/oY7lHj3MVVKzHSxNgD+I/GJM9OZOy+pZl5tt8fYFn0UFn0E93R0STCqv57p
         acvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JV4Ql9KQvz2aQzVgMYltIdHx2mjwmlHNpDGI0MR+TO4=;
        b=l7QfXI75wDe+Y0qmVdGVLY/POviheqbBPdcw3dOJI4znHdZSmjmFhmXviZDAk9je6K
         jVc3jkJ6yAP4y2+fHr2ZzgaahbcFfq4ZmnOaLCJq9hmTBS31VdOiQ4TkglHpam+U+T5o
         4HvloIOOGtUqusvxo6uZ3ISxOS03MhkrZK4Sgbm0RRVGu8sQ6X+DdBIinBXoHbYrLlT4
         KmEULsXMFT7wuLVu0K80sHr8SgMc97mLsprURJ3DYoXNOG0MSCieFGCUK6DAnGWZcCHC
         wQ7Uvs1gZCiVaRkOFFWBNF6IE9xcDCNsXo9QfFZ/emGj3G4lxlr/1dVRc2TnZ592eZ0q
         71Xg==
X-Gm-Message-State: AOAM530VNohVrxnCJVM7GLuJ56iLLsFsJ2+mFtwkiefdSPJ6+XNAfIQd
	d8ScwoMSaOLI+bJpImtCyFRAWw==
X-Google-Smtp-Source: ABdhPJw1merUBFK9auBoXl06LixxbdwajQJcJD3Jz93k8Zq2oCcy2VpISqLU1+xUe0ziW9c0U8hReg==
X-Received: by 2002:a05:6e02:1ca2:: with SMTP id x2mr1826237ill.243.1612975143608;
        Wed, 10 Feb 2021 08:39:03 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id n194sm1163801iod.25.2021.02.10.08.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 08:39:03 -0800 (PST)
Subject: Re: [PATCH] nbd: Convert to DEFINE_SHOW_ATTRIBUTE
To: winndows@163.com, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <1612595455-4050-1-git-send-email-winndows@163.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <1f50c63c-adbb-a89d-9188-e77bd5e6dd32@kernel.dk>
Date: Wed, 10 Feb 2021 09:39:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612595455-4050-1-git-send-email-winndows@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zNbirNmQ9NO.A.HMD.kBBJgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1130
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1f50c63c-adbb-a89d-9188-e77bd5e6dd32@kernel.dk
Resent-Date: Wed, 10 Feb 2021 16:57:09 +0000 (UTC)

On 2/6/21 12:10 AM, winndows@163.com wrote:
> From: Liao Pingfang <winndows@163.com>
> 
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Applied, thanks.

-- 
Jens Axboe

