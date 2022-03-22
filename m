Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C134E4746
	for <lists+nbd@lfdr.de>; Tue, 22 Mar 2022 21:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8802A203B7; Tue, 22 Mar 2022 20:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 22 20:12:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C83782034E
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Mar 2022 19:56:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YBSpUdWam3TM for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Mar 2022 19:56:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2f.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 04463202D6
	for <nbd@other.debian.org>; Tue, 22 Mar 2022 19:56:46 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id hu11so3809352qvb.7
        for <nbd@other.debian.org>; Tue, 22 Mar 2022 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r2M2JOuLYpG55p64DBgWICTYUX9XKVk0kcqlFHGoMDA=;
        b=BdWEzZD7a6xIaBVHFRdbNox7zM+3KtB/l4ApXiKA7sGoF+WeADSfxdtd0xQpwC8hWa
         g6JeG2Z80/19FNjGpr4iiMwWvDON7GmjioGpoElp8r39GvnBromObz72SKhKAZu9y6Rd
         m+dAPibCOIOE0jKp+03ksFpp18ymbJ7bod6FEaum7QZ7/Zp4aQH72I+Lac2VsUGtLFT3
         MG1UlrMTQvWzA3y94/hngQ66uZ9kNZTLLCpEQC5yqqZt23Xnrp0CObSpj7aTdv8U/DQr
         tiC9225gAzIWMrhCJUMH3fla4+j+naVl+7/zxFjFk5zTe3IsAIquFNX4ba58ybm/dJ5Z
         uEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r2M2JOuLYpG55p64DBgWICTYUX9XKVk0kcqlFHGoMDA=;
        b=ZWWZVzQ8LCDxp9Na1r29inUoGPzpDv6kCRYVBLIBzRUDlA9nYkWRd/shB7qmc7EtcI
         6wlExPKmA9FlVWCZ/3Ml0p7d8B2KFnmB1+CeOxpsnaAhLJctChLZBjJD/xjGQ6dA8IdL
         C1fUq9y96jl03AiiOXihjHW4zxkL6Y75YGzKf+T69kA8Z0YCETx0bES3LYIrx/3FY4qi
         J5iWnHddrZgD9cCRwfMNoOKJ62Rv8rmiOfIRG21d3c3iGMbB5OZP8Yq5Zo0KIk+3F7Wj
         mCCw9PyiZwWQaNl6YhHoS/9NctkKYwqByTTmsbc8sUsurabnRdxhv1zLO3UXpX8oNfJX
         Dm+g==
X-Gm-Message-State: AOAM532gFvWYLUrJxxlm5GqySnwTqJ7r1IQTpMAZTVd7rUP1GEbtwd+8
	WfXAhyqmWdU5ymPSUJibX5kzhQ==
X-Google-Smtp-Source: ABdhPJzlHTjaGE8oOc1ZZY3SXA8xCNSRPWhxCVpIl/OzVXEZg7DtqPppTUjBDOPrYOpJH5O0xRAaVw==
X-Received: by 2002:ad4:5ec7:0:b0:42d:7892:c5fe with SMTP id jm7-20020ad45ec7000000b0042d7892c5femr21117429qvb.100.1647979003218;
        Tue, 22 Mar 2022 12:56:43 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id g21-20020ac85815000000b002e06e2623a7sm14672786qtg.0.2022.03.22.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 12:56:42 -0700 (PDT)
Date: Tue, 22 Mar 2022 15:56:41 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	zero.xu@bytedance.com
Subject: Re: [PATCH] nbd: Fix hung on disconnect request if socket is closed
 before
Message-ID: <Yjop+VdZi5xbHe+b@localhost.localdomain>
References: <20220322080639.142-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322080639.142-1-xieyongji@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <K8V6tSDX66K.A.Z7C.Z2iOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1744
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yjop+VdZi5xbHe+b@localhost.localdomain
Resent-Date: Tue, 22 Mar 2022 20:12:09 +0000 (UTC)

On Tue, Mar 22, 2022 at 04:06:39PM +0800, Xie Yongji wrote:
> When userspace closes the socket before sending a disconnect
> request, the following I/O requests will be blocked in
> wait_for_reconnect() until dead timeout. This will cause the
> following disconnect request also hung on blk_mq_quiesce_queue().
> That means we have no way to disconnect a nbd device if there
> are some I/O requests waiting for reconnecting until dead timeout.
> It's not expected. So let's wake up the thread waiting for
> reconnecting directly when a disconnect request is sent.
> 
> Reported-by: Xu Jianhai <zero.xu@bytedance.com>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

