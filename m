Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4A1784E3
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 22:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED34F20132; Tue,  3 Mar 2020 21:30:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 21:30:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BA0B02011B
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 21:13:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fdQHCmmkiyEk for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 21:13:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf44.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 67FC620118
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 21:13:26 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id o18so26779qvf.1
        for <nbd@other.debian.org>; Tue, 03 Mar 2020 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AgLd9ecB3xJpGa63JNP+56+CM8f5C5uRGJU8kSIBW9A=;
        b=ol9h7NSTqG/w/KKyNPlxUrQTpPcy4KKTUZ/mrRQAzPMw5XGJ/P/zbApLF/VBFNj3NI
         oxXNotk/e/2qo9H7euspM5os7xoAnPDQKQGm3y6bh6qWbr34tV0/QRaWn6KA93JZczrq
         mYzWYl1o4DHi2i/ERjq3DAzTZTDhmGocZjBxd2RYfmAvedMpZE2exOlSEOfOAFfyNcPn
         QvFP3Bi++tPo+k+lO4vB4ejcpDBKhhGvrlDcYQ+36DikjHJ7/TaU+yPkDNxxW6VY5N9V
         56Exn8cBIPSXcaPYFA19ue0pkXtF/yyUlfTWqJB3Bu4rKnFICHdlrOJvhs3NaX4+8pkE
         rizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AgLd9ecB3xJpGa63JNP+56+CM8f5C5uRGJU8kSIBW9A=;
        b=UmYEvUVkn3OcNRWOrirHhvVIqYE60lmwqjmo8qm1geRUbMMhoyz+ifmaJcdTTxgKhW
         jo2NPjv4yqogh1zGVS19HHqOt9N8RdZDj4bQwC1B2aRbpTFbtH3cPXT5H07qA9p2p3xW
         gNPrIqi0temEeQK03MOKqCd5CGjLnjpHcIAt7bM5Dyg5jPFD3jLthexlBWtwQz6Haus6
         taPoYj6TUIx/jVs9mxht5Bk4Li4qD5UJG4OHTElOUAa1xiG+ALToFI30J1d+3Za1XPe9
         j6yKs8Fv1VzGwKa7Z0mZK+TufkEETWW70Fiv4RtF3j5kCqEl60izwbybCt5V8NC/zWB3
         mZBw==
X-Gm-Message-State: ANhLgQ1IvSTMkbTf2hfEyAM/mG33AJ1BiIKFO/3lGmGpwgTVzojaOrF+
	RRfXmAiiEKYGVUGhWGBvYWM1aQ==
X-Google-Smtp-Source: ADFU+vt2SgrsWRmw/PrsGdszCg8sQB/RJ1Z8RUPeY1eA2A0+Lgm6t4h3a3T2IB9d4NOizHb3IJX1gw==
X-Received: by 2002:a0c:f905:: with SMTP id v5mr1950220qvn.174.1583270003184;
        Tue, 03 Mar 2020 13:13:23 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id g2sm12632889qkb.27.2020.03.03.13.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 13:13:22 -0800 (PST)
Subject: Re: [PATCH 2/2] nbd: requeue command if the soecket is changed
To: Hou Pu <houpu.main@gmail.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-3-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <34249aaa-7f0e-d0f4-7c1a-28aee9bddaa0@toxicpanda.com>
Date: Tue, 3 Mar 2020 16:13:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228064030.16780-3-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <w9LpnXejV0H.A.dBB.gxsXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/840
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/34249aaa-7f0e-d0f4-7c1a-28aee9bddaa0@toxicpanda.com
Resent-Date: Tue,  3 Mar 2020 21:30:08 +0000 (UTC)

On 2/28/20 1:40 AM, Hou Pu wrote:
> In commit 2da22da5734 (nbd: fix zero cmd timeout handling v2),
> it is allowed to reset timer when it fires if tag_set.timeout
> is set to zero. If the server is shutdown and a new socket
> is reconfigured, the request should be requeued to be processed by
> new server instead of waiting for response from the old one.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

I'm confused by this, if we get here we've already timed out and requeued once 
right?  Why do we need to requeue again?  Thanks,

Josef

