Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 59876102965
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 17:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 25FCB207BA; Tue, 19 Nov 2019 16:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 16:30:09 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 75ED8206CB
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 16:13:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YebkHnpT9BZK for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 16:13:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd43.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1940720719
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 16:13:39 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r144so23798293iod.8
        for <nbd@other.debian.org>; Tue, 19 Nov 2019 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CuQtXznqoyz5kssTjNmYau458WwEA/pCkBJj2OVVqhw=;
        b=Y5yP5yxkELILFBRuBu782FQosIibbXWrJ8k7FKQ7MfRe6h15lWXrRvR/RpmAanLRyb
         sOHSEKJc89xwSjmr0aegjdhW95nfNpI0UBLLh/Dod62dh7jjr0LmY5JpGhIWiQFzl4TD
         TqqIeS4cy8gEAvmpofDPnro5dCnkUcrWaIFQ5SNWHTKLsb1snDYcJaA15KuscmjBbAis
         aU3lD8Ws7FIG/mm/iqeJvgZaE3kh+ku6pu5ubn37PAFNRkVs9omWdk3Txfk8JteJpZBr
         keK4Ips74YC+7A92ul65nGHBp+l0JtVT6IBmXKVW70OM9pqqrn0Pf4YuMMHNaOcwr9kj
         3/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CuQtXznqoyz5kssTjNmYau458WwEA/pCkBJj2OVVqhw=;
        b=XYLrYQeaPjjXAxQzEmkPWpB9Y90eU+dGA0CEPQuENyUeREZk9GLQ4St+MNx+IcDBK3
         G4TsH46lBYdXaPPohqMUypy+PIlWklg3ChLOsXFsV51vP++0wdec4MQBGPzTx+N1Ewkf
         fdSlfTa6W9OmbJ9GXakiY3iix8Fe5ZROSZVQgcOnnC4870LwL706GkaZgnUhXg0qLwgP
         JCCR7QMRwKljXgwsgT3S5QyRwlEo3G3UhPQLuThu7Whg0S726ct3WAZKQuADkJMDUBIs
         mfpmGf/CR0Oh1EVfKO7uphH84fKUu2GC1BU0j+/HNh41c0tgk2U87noMcl1zJ6W5Ait4
         ygDw==
X-Gm-Message-State: APjAAAXHO4RN8brQOSWj0pw5/Ca4tZxdX9bvwhFHvIviOBoOIGih8ZTW
	jwNXzjrzA0lU/CeYGWyYsDF+9g==
X-Google-Smtp-Source: APXvYqyrsEqORsYQXRnAbGvk2VKAQluxp4RFlBrdGsPXjw9zQza5QmSohcjFAyNMdDM3atBr+47PwQ==
X-Received: by 2002:a05:6602:251a:: with SMTP id i26mr18935296ioe.302.1574180016622;
        Tue, 19 Nov 2019 08:13:36 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id t11sm5546611ild.38.2019.11.19.08.13.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 08:13:35 -0800 (PST)
Subject: Re: [v2] nbd:fix memory leak in nbd_get_socket()
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: Mike Christie <mchristi@redhat.com>
References: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <d68d17be-0c4e-1286-4327-0e3ba6600eca@kernel.dk>
Date: Tue, 19 Nov 2019 09:13:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uzbbZl5LyzF.A.fSB.RiB1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/740
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d68d17be-0c4e-1286-4327-0e3ba6600eca@kernel.dk
Resent-Date: Tue, 19 Nov 2019 16:30:09 +0000 (UTC)

On 11/18/19 11:09 PM, Sun Ke wrote:
> Before return NULL,put the sock first.
> 
> Cc: stable@vger.kernel.org
> Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Please always CC the author of the patch you're fixing.

Mike, Josef - we probably need to get this upstream ASAP.

> ---
> v2: add cc:stable tag
> ---
>   drivers/block/nbd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index a94ee45..19e7599 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -993,6 +993,7 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
>   	if (sock->ops->shutdown == sock_no_shutdown) {
>   		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
>   		*err = -EINVAL;
> +		sockfd_put(sock);
>   		return NULL;
>   	}
>   
> 


-- 
Jens Axboe

