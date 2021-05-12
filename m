Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DB37C184
	for <lists+nbd@lfdr.de>; Wed, 12 May 2021 17:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C3E972035C; Wed, 12 May 2021 15:00:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 12 15:00:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7745720380
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 May 2021 14:43:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PlhEz9Wqlz5N for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 May 2021 14:42:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x42c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B08302035A
	for <nbd@other.debian.org>; Wed, 12 May 2021 14:42:58 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id h16so5904173pfk.0
        for <nbd@other.debian.org>; Wed, 12 May 2021 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+UirbY6lxN8Jzb57kXaKy+LkPAyfcN95Fxx30BqluHI=;
        b=0ose4SAhg1I5qKEKEcVMb7ymxoyI9/Hg4OryPbTqcFMggjrx0q2IWLxCZ0rVbTW44J
         mz7yqbArVH8DLeQhntDCg3pFuDvBymAmf5OAgXVrTyZUvG/tkQGfhKKaVLuTQ1h2PqDt
         2zg5lhkqe7MNRg8Ggu2G3HOYI0KLqJXIFiANsPHpD2NddZmfePSOxGLegEWzlPiwvWfJ
         49HaHzXQj2s6P0pU6MasZPC377orOaybGabrc4vTbhNN3nNJc0O6Vvnaz9iUKK4Qq8to
         cvM9zu/D6f8DXR2onh+lxXap4+euA0miF4Y1oEB6pnUtlUE5KMKiBCo/lC8xl2TxTmTY
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+UirbY6lxN8Jzb57kXaKy+LkPAyfcN95Fxx30BqluHI=;
        b=FxZ2bpyONp8OzW+TXdumbpsr1AOJkGUO8sTCm9U9Ppfxy/xgSNi5OKnDhwA4mk6NYB
         SvHRl6DS4SHwqilYuqSv6WUKRoZFDZMbYVXW8XKGn+iJA6T+yFIZMFUx76oS1XxrbQRg
         4VSkV68qTAF8+f/xe0JTZeTp8WxJSvpbzTpjPiBXY78IeOOif0jj74S9WFxjQhT4ITVY
         owBw4zQV2BP/N7SHn/PyOkjZ0GaejilHPMAle9DvOoI+Hi5r8KKbmXdKlTLmRRm5UIGr
         e0jDbZoLwu3shplaTolZDAIR3MLOhZebcLbTurj5GxfRNDmfxKEWDzw8t82npk8SFmUU
         CUAA==
X-Gm-Message-State: AOAM532nRGFjY9mAZwrGXhVNHyPhqPMNYRb+Kt5qVKF5xlaT8JLv4PMg
	amgx2es9hY8Kc6hYQo6HDdmkrw==
X-Google-Smtp-Source: ABdhPJzPhS2CIOVzPw8qvsFuRca1NX77mw4hBIAMHNySwWOzhdg09kxFDd0g2e5VDnxDnjKiRxqDEQ==
X-Received: by 2002:a63:904:: with SMTP id 4mr9588621pgj.64.1620830574139;
        Wed, 12 May 2021 07:42:54 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id e20sm4766519pjt.8.2021.05.12.07.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 07:42:53 -0700 (PDT)
Subject: Re: [PATCH 0/2] fix a NULL pointer bug and simplify the code
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com, Markus.Elfring@web.de
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20210512114331.1233964-1-sunke32@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5196e425-c073-25e7-b53c-34ffab1fc1f1@kernel.dk>
Date: Wed, 12 May 2021 08:42:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210512114331.1233964-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EW0tJzXXW2D.A.rSD.51-mgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1157
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5196e425-c073-25e7-b53c-34ffab1fc1f1@kernel.dk
Resent-Date: Wed, 12 May 2021 15:00:09 +0000 (UTC)

On 5/12/21 5:43 AM, Sun Ke wrote:
> fix a NULL pointer bug and simplify the code
> 
> They should have been applied for 5.12, something was wrong.
> So, send them again. 

Applied, thanks.

-- 
Jens Axboe

