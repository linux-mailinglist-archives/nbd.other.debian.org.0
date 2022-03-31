Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E54EDC09
	for <lists+nbd@lfdr.de>; Thu, 31 Mar 2022 16:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 32E3321B58; Thu, 31 Mar 2022 14:48:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 31 14:48:12 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E5A9F21C64
	for <lists-other-nbd@bendel.debian.org>; Thu, 31 Mar 2022 14:30:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AoCY2Nsx2TLv for <lists-other-nbd@bendel.debian.org>;
	Thu, 31 Mar 2022 14:30:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x133.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D1E1921C5D
	for <nbd@other.debian.org>; Thu, 31 Mar 2022 14:30:49 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id r11so16858741ila.1
        for <nbd@other.debian.org>; Thu, 31 Mar 2022 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=l8CekeoQZXHX4U3TiS2vpp4O2YuTCmdU/BDSBQosw7Q=;
        b=2t3SM0cZXUR72lsXD7aWv01f4VUP1+TsCWH1VXhR9gW8eeqvvAYm8IPed6tPPC/+bT
         /wf9r2P3V48ygYra/UM1VT50ENC51HGaz5CRa65IhBEmNu5LJEGBB7CqL0dNZJ++bP5l
         ZuFHQmFFFJgh/P90XI1k0WCdnaV/65iQKBTWubWDoonZK3zxaSLZQXZus5lAGOBhywkZ
         TrV5h5uml6+9t1iFBJ5FnSDBddgz0muYcbWXUBl6LXRAAfpdksB4eK30BIE/mJJM1ZHC
         rmY/8/X0BmT2ei/CA6CADJPhXxCAdFQCskc1lcm8c4RtAGPxzECZY8oM8CNOmAkuRemv
         /OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=l8CekeoQZXHX4U3TiS2vpp4O2YuTCmdU/BDSBQosw7Q=;
        b=1cf8X/XRzhuXLzxIEOdQVlJkQXs5XXRsISfEp+zsBwBnrztpz3uEuLh1LjuH52psQS
         KKvQZe1RQ54m27mH6FQ4jhr090X7bxMcsDdLaZO4PyfggVy89ERWvl8NcYvToUi5SxRX
         z2L0N+hDyol/fyIqQKZ5Om74qjeNSR7nLg3hHYTDoqZo3g52Qtd7Ht3RYvGP/4fPwhgQ
         5rQQNH3KftktIjXJMIxLN6SJ4TkAEKGYp5vkQeFhsiZ+2BH0n/tw5vUkKj3F97/azyJ4
         i5iu96/MRHQ9STwVUsIppKVUj9/7sJiC21K1bTfdkQm9JQDYaUoRO6RjnfTOlgbv9jT4
         56YA==
X-Gm-Message-State: AOAM532KF3toK1RgR7q0jI+vjE955BHoq41vUxuvTBuJaSE+x17iGES+
	cZSoFWtYMmaCAHoP7QoMJs5TlYIhp3B1Ejr+
X-Google-Smtp-Source: ABdhPJz25adczaNwDR175aQhqMn4WdHp4yEMllsYZBu8VTCksFw0OQj+38m10GkF9u9YGSPT+0qfJg==
X-Received: by 2002:a05:6e02:1c0a:b0:2c7:75de:d84 with SMTP id l10-20020a056e021c0a00b002c775de0d84mr13381733ilh.186.1648737045567;
        Thu, 31 Mar 2022 07:30:45 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id i3-20020a056602134300b0064620a85b6dsm13883109iov.12.2022.03.31.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 07:30:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Zhang Wensheng <zhangwensheng5@huawei.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, linux-kernel@vger.kernel.org, yukuai3@huawei.com
In-Reply-To: <20220310093224.4002895-1-zhangwensheng5@huawei.com>
References: <20220310093224.4002895-1-zhangwensheng5@huawei.com>
Subject: Re: [PATCH -next] nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
Message-Id: <164873704446.46490.778795283218997371.b4-ty@kernel.dk>
Date: Thu, 31 Mar 2022 08:30:44 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <A92JhLPcosK.A.DtH.s8bRiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1843
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/164873704446.46490.778795283218997371.b4-ty@kernel.dk
Resent-Date: Thu, 31 Mar 2022 14:48:12 +0000 (UTC)

On Thu, 10 Mar 2022 17:32:24 +0800, Zhang Wensheng wrote:
> When 'index' is a big numbers, it may become negative which forced
> to 'int'. then 'index << part_shift' might overflow to a positive
> value that is not greater than '0xfffff', then sysfs might complains
> about duplicate creation. Because of this, move the 'index' judgment
> to the front will fix it and be better.
> 
> 
> [...]

Applied, thanks!

[1/1] nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
      commit: 6d35d04a9e18990040e87d2bbf72689252669d54

Best regards,
-- 
Jens Axboe


