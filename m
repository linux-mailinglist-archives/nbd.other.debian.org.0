Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DC44379A
	for <lists+nbd@lfdr.de>; Tue,  2 Nov 2021 22:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6A4A22043D; Tue,  2 Nov 2021 21:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  2 21:00:13 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 808FD204BE
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Nov 2021 20:42:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YS6XioVCWpeT for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Nov 2021 20:42:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd30.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1F796204D5
	for <nbd@other.debian.org>; Tue,  2 Nov 2021 20:42:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e144so252443iof.3
        for <nbd@other.debian.org>; Tue, 02 Nov 2021 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=K/fqbzKS7d7M3R+dtjsJkzxyoCQ0qXkQ3ZMxTQROrjY=;
        b=0jOnt+d6rkjr0xYYasEo/Cma/n2fhTr9QJnbA/Dl6G6MGmPUSK5+5R2eLkwDRV1k7U
         sBzxiL42a6mqjwsXausPbWMjLIzjKxpjYwyJ5RwlsOcoPaT6X6p/UfKxYOtHtqyC6GU7
         ugH3ygUqUOXgNZzKTne4c4ffQ42OzTL7p3xZ0IHMHerTc5oCKis+UAZPqMtiaMo6vnPK
         0izcH3MXVr187f2PCLw4kyNhDOBm1INviqGtyNz1Afr1kzgkmepYbcT1LdDFCeR8OOnW
         757T3j+hhV6QIPMDLWCjeCSOp/jTZ7Sc6M0jUC/lqnAic7kKpQEdsrWbcJTcFiRXj/3K
         BaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=K/fqbzKS7d7M3R+dtjsJkzxyoCQ0qXkQ3ZMxTQROrjY=;
        b=qM1Utbr5eqyjWUbe1iB3sI5r/Lj7Ng3ifzRHyQFc/k8GB6ejAPFM1VcUORYkMrdwQ4
         ZhjmZQ3tjYyOdlU/roxHVlbPLMFlu0Bp/fYscrtzKt5TM/L0T6DQEuNxdqBy4RnWJBBm
         nf05NwJeJuUDodMV8Pfw4Yqb5CGq7UJdEIYypfaJMX8HV0PD55yk0+WC9EJCg3Dw8qXK
         ogBzX5Pb4SUh8F6MGcJEqMXxew6YTKzh+Rs2KYrmaVKYDBIqzjIlMjNIzGeZmxF+/ae4
         V1nMnlce1wxwBHGry6Epnt73J0rdcBQLEgIga/lpnOA5yGtvF8NlJPkRmikWRATuZk1z
         kEyw==
X-Gm-Message-State: AOAM5326zOJSkG3b5Olw8D3enTzy3SXBzQFu9gToJCW5xV7xJ6JJArhc
	rXUb8NQbZ0EwV9o1EM/z5wFQ+w==
X-Google-Smtp-Source: ABdhPJz3m9eBOhDC5NdhELv5Gcmquw7Vd2ye9VvFsUfeC26PRRr6aNPvdUP7IEkS1SlWnuJobt6JKw==
X-Received: by 2002:a5d:8242:: with SMTP id n2mr27354163ioo.170.1635885768482;
        Tue, 02 Nov 2021 13:42:48 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id n4sm84359ili.10.2021.11.02.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 13:42:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Yu Kuai <yukuai3@huawei.com>
Cc: yi.zhang@huawei.com, linux-block@vger.kernel.org, nbd@other.debian.org, linux-kernel@vger.kernel.org
In-Reply-To: <20211101092538.1155842-1-yukuai3@huawei.com>
References: <20211101092538.1155842-1-yukuai3@huawei.com>
Subject: Re: [PATCH] nbd: error out if socket index doesn't match in nbd_handle_reply()
Message-Id: <163588576788.463006.5186111103177394887.b4-ty@kernel.dk>
Date: Tue, 02 Nov 2021 14:42:47 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x-v6KzeHxjI.A.FUH.dbaghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1607
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163588576788.463006.5186111103177394887.b4-ty@kernel.dk
Resent-Date: Tue,  2 Nov 2021 21:00:13 +0000 (UTC)

On Mon, 1 Nov 2021 17:25:38 +0800, Yu Kuai wrote:
> commit fcf3d633d8e1 ("nbd: check sock index in nbd_read_stat()") just
> add error message when socket index doesn't match. Since the request
> and reply must be transmitted over the same socket, it's ok to error
> out in such situation.
> 
> 

Applied, thanks!

[1/1] nbd: error out if socket index doesn't match in nbd_handle_reply()
      commit: 494dbee341e7a02529ce776ee9a5e0b7733ca280

Best regards,
-- 
Jens Axboe


