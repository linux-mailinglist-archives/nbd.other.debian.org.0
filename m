Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9454F5EEB
	for <lists+nbd@lfdr.de>; Wed,  6 Apr 2022 15:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1101020506; Wed,  6 Apr 2022 13:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr  6 13:12:09 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 18E0E205A8
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Apr 2022 12:55:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tmB5ecOyAjhj for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Apr 2022 12:55:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pg1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 42AEF205A6
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 12:55:37 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id d185so2100127pgc.13
        for <nbd@other.debian.org>; Wed, 06 Apr 2022 05:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ia9+/STEIK6s5M7yq5g28XApY0uGE7BS8OCfCM69b6A=;
        b=1jHJjG0vgz25gIzyBuScalLuzhFAfWyPNeNxdThD5QdRv6nV6NS/H9b5sgMPyXcpeA
         jCApD1jmvsgeKI5/tguxrCXmMwlkeU+UtDeN87DbXpH4BDnpcB6dNPoaNFysouTNi34D
         mwPOhoX8zj1JT2o34AsxHa7g1kWrXlKyqZo4B12OymnG/M27MMOZOiT0ZqBIcj9nC5R8
         nEgHt4nRlVA9IBDe+fKF7fgMLJMJoAxtikpXI44H+hEZOFb1kQS4ccI3urifRwJofOu2
         YNBnw7a4es5sxt9ZeJGKY6WGELxoWRLrYJlPP0GAzQkQbAbpFKYrApa4HUSOepOQTWEw
         CfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ia9+/STEIK6s5M7yq5g28XApY0uGE7BS8OCfCM69b6A=;
        b=N2QZBoPqIX6Wyhivj8zuv+ks4TU2zAbfkxm5Z+GHGbELopyNZkllbMazBlCzSmOy5N
         ate4CMtRo5mVhCdX/9a7ZKZDT/2VzMOc6EbJHiLbPvcSQCQTWHUor1m2iLj0szFMInnr
         U3X3EC/UvK6F5xkn96gjRbe8KBORQYZAUa3BduzSWM0T2DLWO2RAuTOs3yyJfl7tVIoI
         DXGddSt2N9vUizbURpfKckdluHR1eWaYei1vFnTWuicUa8Rrp3OwPrHGg5KQTL0A6tqH
         wwIxmZwtU5NvlEEexPy6XRIidJK5vCj7UMWi0+kcHB8DzT8sOxuRKypIa47GBc5oE6rp
         D3Mg==
X-Gm-Message-State: AOAM530nmg32Rn+OnO3vzlZk/QsBYusuNEgj6QR9ZP5krR7Fg41UTeTE
	YJkvMExrl1xfpaTEZ2RiU/R5RQ==
X-Google-Smtp-Source: ABdhPJw2Mh1njoqbEPjpvRC2p3sOjeTsg/pWyOftIQWGeQ7ifA9CMlk2Fr9+xIAJq2EzH3psDacsUg==
X-Received: by 2002:a05:6a00:a92:b0:4e0:57a7:2d5d with SMTP id b18-20020a056a000a9200b004e057a72d5dmr8534617pfl.81.1649249734194;
        Wed, 06 Apr 2022 05:55:34 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b004f72acd4dadsm19647671pfx.81.2022.04.06.05.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 05:55:33 -0700 (PDT)
Message-ID: <263199dd-34e4-36ff-51ef-23a8f4bbe5b2@kernel.dk>
Date: Wed, 6 Apr 2022 06:55:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] nbd: fix possible overflow on 'first_minor' in
 nbd_dev_add()
Content-Language: en-US
To: Zhang Wensheng <zhangwensheng5@huawei.com>, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <20220406112449.2203191-1-zhangwensheng5@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220406112449.2203191-1-zhangwensheng5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JsdxcgnVr5H.A.kWC.pGZTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1885
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/263199dd-34e4-36ff-51ef-23a8f4bbe5b2@kernel.dk
Resent-Date: Wed,  6 Apr 2022 13:12:09 +0000 (UTC)

On 4/6/22 5:24 AM, Zhang Wensheng wrote:
> When 'index' is a big numbers, it may become negative which forced
> to 'int'. then 'index << part_shift' might overflow to a positive
> value that is not greater than '0xfffff', then sysfs might complains
> about duplicate creation. Because of this, move the 'index' judgment
> to the front will fix it and be better.

What's changed in this version? Always add a v2 to both the subject
line and below the '---' so that folks reviewing this will know
what changes you made since the last posting.

-- 
Jens Axboe

