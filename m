Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 261DD4EDBA3
	for <lists+nbd@lfdr.de>; Thu, 31 Mar 2022 16:24:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9A9C21C42; Thu, 31 Mar 2022 14:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 31 14:24:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DB2762029B
	for <lists-other-nbd@bendel.debian.org>; Thu, 31 Mar 2022 14:07:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LQCLeDxxopFr for <lists-other-nbd@bendel.debian.org>;
	Thu, 31 Mar 2022 14:07:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CF7C5202A1
	for <nbd@other.debian.org>; Thu, 31 Mar 2022 14:07:40 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id t19so21480918qtc.4
        for <nbd@other.debian.org>; Thu, 31 Mar 2022 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RUo5kwiJz1bXcAqbqhS7EP1tVYXGo0oDgLG0Vt1y+Yw=;
        b=piasVfJJs0bqvNJ4PSZRAVyjHcXIX+f20OEUWIVbZrN66k1VJSR4dx7gqLu3aayp7Q
         270fgEB5o1cj86OnfA4+P3m/Lfik2iBL74oA9pmDfPB358bkLsO6KS1/yi5MrnrxLpqP
         2/PmwBHugQKp8Jg+9/HpgKLnulHPVq56TNbJAUJz66lV6aXiI8v31Ors3hXoU1tLa7Vr
         +vvKGo31JwJiNS8dfwtiBJbipCXMugjSYuBMb3blJcywsgXzbvPlmuO1/KMFZoshZgzN
         o43bkTuDeIplUupMKNaxvm2swmnVZJnb/pd27kwSPyjYbWW4hlXTR5xvlW+lRYXKQEJn
         /9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RUo5kwiJz1bXcAqbqhS7EP1tVYXGo0oDgLG0Vt1y+Yw=;
        b=BBk/WELOZ6YWHV6Ulm9dgBBKc/D+NEPM9cg/rP5h6GULctcJA5sWn34mkbrWm0sKYX
         yJ2IwONxyRJoBPmw3wAfNvw19PdZ/b7z5sVHqe4Yb49TQ7DYHRYZblzUPimGW7f3mn2/
         PxKzBVtvCjJ2dW31dzlQbMGHavSY999MnJx2VpVoje7LyCiyUQ8EYubBaahdPg//4OB2
         SCFSy30KyKNzIyfqhGaqbwD+/15IMIRTBR2O6anuGB35iPlzfJm4M2YWfVB4gKoFrQ4G
         eWbHXc0jc4YzXbesm0d/hrNRohCFSybV0QH6B9nkqbDt2h7d0vt/iLBfSpmyuJn1R49j
         p/tQ==
X-Gm-Message-State: AOAM532avg8r+4U1rh/DQp1nR5Fo7cXqh/wxeQXhWJuJVdzWcPBgbraB
	dT9fP4c0usCpL5V7qjY2o3hizQ==
X-Google-Smtp-Source: ABdhPJy7PzQlsoFAhL/5nP5uePzyN9D+3lTBYWt8xfk4DVXO5W6tcsmGikWZnPr0rN62xnxYhv+yfQ==
X-Received: by 2002:ac8:5fd2:0:b0:2e1:b346:7505 with SMTP id k18-20020ac85fd2000000b002e1b3467505mr4464103qta.94.1648735657640;
        Thu, 31 Mar 2022 07:07:37 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id 8-20020ac85948000000b002e1cd3fa142sm20349064qtz.92.2022.03.31.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 07:07:36 -0700 (PDT)
Date: Thu, 31 Mar 2022 10:07:35 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Zhang Wensheng <zhangwensheng5@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	yukuai3@huawei.com
Subject: Re: [PATCH -next] nbd: fix possible overflow on 'first_minor' in
 nbd_dev_add()
Message-ID: <YkW1p4oP9mmcuwK9@localhost.localdomain>
References: <20220310093224.4002895-1-zhangwensheng5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310093224.4002895-1-zhangwensheng5@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8RIGn2qcJHE.A.jeD.JmbRiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1842
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YkW1p4oP9mmcuwK9@localhost.localdomain
Resent-Date: Thu, 31 Mar 2022 14:24:09 +0000 (UTC)

On Thu, Mar 10, 2022 at 05:32:24PM +0800, Zhang Wensheng wrote:
> When 'index' is a big numbers, it may become negative which forced
> to 'int'. then 'index << part_shift' might overflow to a positive
> value that is not greater than '0xfffff', then sysfs might complains
> about duplicate creation. Because of this, move the 'index' judgment
> to the front will fix it and be better.
> 
> Fixes: b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")
> Fixes: 940c264984fd ("nbd: fix possible overflow for 'first_minor' in nbd_dev_add()")
> Signed-off-by: Zhang Wensheng <zhangwensheng5@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

