Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 717193EBCB3
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 21:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 328B720447; Fri, 13 Aug 2021 19:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 19:51:10 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 05DC520187
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 19:33:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id swr6BGo2Fk4V for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 19:32:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1036.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8BEC220162
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 19:32:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so22146352pjr.1
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WpzS/24q3pqxhkhlYWjPCwEJTnQ1gDnycgi6qLljlS8=;
        b=CQShZo6d6mQu6tpYzkUF6OL9B1//C/IxbepKm6d/YT5gjLvaWNnNHOTIPpVvk0EOk2
         28/V/yYlmVuyVKVOCUNWF3f0jQQ3+u6ZvRGFeKvHjVVK9PjzxRoobUkfCeMY1Gwjw6BV
         xBX0WwMpJ37i1DalnazOQsCfTdRuzg6J1av53VGEhW/UN4UZS4d/ELLEfRHRpWaEu5XF
         6PSLdPuj/z+sgCzeb2jG1MR5gE54Ho0DfSoeKezq/VqwD11dZQ8fRgEDZNi2tbGLntSN
         LYpdBW0D03O6RhKVwKBjuCu3aN2IUO6EfD52EByrytsI7SUQ2/3n7RI95E4rOnkrUauJ
         ZXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WpzS/24q3pqxhkhlYWjPCwEJTnQ1gDnycgi6qLljlS8=;
        b=lxGWA6Qi7fVbUSFEG+uTAaWucgEZ9FPbt5nND31Lf4QKYOMBQCUfk5oXNgPJH5bglq
         YqwzWXsvp8CeEq5H0AkgJ0kyU5G/y9g8hZ7UUwYDifdLQ+gE5hvucV+FjBDBRX+xzQCB
         VU8QnmToNFvx/yNrSt8MklNw291zWJig+gHJk9hZJa4UMwfRTumAbye51x2pl9Oxe+Ca
         WLuEJH/451ApM8etxObFxYuN8VE9im9keOlfV7895cMpFH6LRItg27GM/bJCyoybYUxY
         b5R9UaQSxyUJzer+rfgwgeqlW1sb6a1caZ8vUjwVLDu93OgNzNRdbYAewty2xbTTSbFD
         iudA==
X-Gm-Message-State: AOAM532MZQIwCDP+pqv6gmIhZaBfMRerBjZ5dAOzZEsqsXJZA9lndsmb
	qONPFA+CcdY6Hx5RuwclR5hmdQ==
X-Google-Smtp-Source: ABdhPJx4PZtuMxU2JerWqM/YaRO4AatYhh3Ifqwo11TmsGyG+c+bZD07qnxVTNIgGzuF7orMgJhfXA==
X-Received: by 2002:a17:902:9a8b:b029:12d:7179:2f6d with SMTP id w11-20020a1709029a8bb029012d71792f6dmr3304238plp.54.1628883172579;
        Fri, 13 Aug 2021 12:32:52 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id a17sm2988800pff.30.2021.08.13.12.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:32:52 -0700 (PDT)
Subject: Re: nbd locking fixups
To: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Tao <houtao1@huawei.com>
References: <20210811124428.2368491-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <eeb57c27-b6be-67d7-09db-efe60e516581@kernel.dk>
Date: Fri, 13 Aug 2021 13:32:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MCsbQr7k1PO.A.59F.u0sFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1288
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/eeb57c27-b6be-67d7-09db-efe60e516581@kernel.dk
Resent-Date: Fri, 13 Aug 2021 19:51:10 +0000 (UTC)

On 8/11/21 6:44 AM, Christoph Hellwig wrote:
> Hi Josef and Jens,
> 
> this series fixed the lock order reversal that is showing up with
> nbd lately.  The first patch contains the asynchronous deletion
> from Hou which is needed as a baseline.

Applied, thanks.

-- 
Jens Axboe

