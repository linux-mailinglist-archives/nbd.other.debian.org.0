Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8596C4DC8
	for <lists+nbd@lfdr.de>; Wed, 22 Mar 2023 15:33:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 095AA20690; Wed, 22 Mar 2023 14:33:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 22 14:33:11 2023
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3CBF2058B
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Mar 2023 14:16:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nOjQqHq5a5eI for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Mar 2023 14:16:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-yw1-x1130.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 964E420510
	for <nbd@other.debian.org>; Wed, 22 Mar 2023 14:16:00 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-544b959a971so306963347b3.3
        for <nbd@other.debian.org>; Wed, 22 Mar 2023 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112; t=1679494557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Whislchss/sFlCFTwP31713E4FxIStQL6qfZ4WUEnIc=;
        b=tzVmChHwG5UdzVVOpXkf2rTQATcV+/+zaZ4pw3uDOzqEhkRt5Ve9ob8pgqEPs/Y1fe
         UTg2YOvzk6LqHz80jJegh3QK/C6Nw5mUFmQRuYQdxN/g06L4n2D8VqGTpKrEwVLXCMyg
         bcLY5fticeZdjLAS82sbu5TBTjdYbbZWwVewaUa46wFZTPzT8Iaeq+jOe9TXtX5fDQhM
         bH0UkD0Bze72U3h9g4fm9xhtBi74DWE9y5/g7HVJ77mStLDJNqI5IlGO35ZFBslvbkdt
         0tnWP6LHWVGlPLgYq0+b9Iy7dVlw0jYqZHf1nX5ZUpvjRTg0T1AmjYqWQfawOzmxCgxb
         Ollg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whislchss/sFlCFTwP31713E4FxIStQL6qfZ4WUEnIc=;
        b=f1Z7WP0YN1Za7XM8LIU77XRfRH57l+4JhKbECvnk1xXzr3Q8BGmYX+JF/OjmstImYR
         nizC6YjXMVF7/F9Gu4du2ADnWkVsiTnTGdiZzUt5OwYKv2RaGMWiZabZXms25PJDzmbv
         4QHnEWzbU0gV/tGj24DEpmP5sqe3Z7FZSjM6Sh/StS4pu2sipNnRzhQx0UxTiLJ3IKTj
         pNfrncpqUsP+OB/ORNJOI49kN9dWW/KNrdu06RN9+qSsffHwlW2oNpLYZJri5iZti8NO
         TTdoOPl3qO/xmtl/LIh8yAp3Jgklrw091FiCgP4j0lyGVa7kcQ1ztH/e8a/YpAOE5wyA
         TzwA==
X-Gm-Message-State: AO0yUKVYg28aee6PMxKjWOgTkssE5LAS0Gg9nWZ7H0k1LyIiWNOmxVbK
	jC7TtCmw0Q7q+Z5O28GC7YlrjA==
X-Google-Smtp-Source: AK7set867nYOJLPUXEWSXWMJFE/YmBaPwP8V/3k5TMR93AJK29UptcHHOv2RuPaUN5WddwnxgNj1hw==
X-Received: by 2002:a05:7500:5bc3:b0:fb:d3c:28fe with SMTP id ed3-20020a0575005bc300b000fb0d3c28femr62914gab.29.1679494556330;
        Wed, 22 Mar 2023 07:15:56 -0700 (PDT)
Received: from localhost (cpe-174-109-170-245.nc.res.rr.com. [174.109.170.245])
        by smtp.gmail.com with ESMTPSA id f66-20020a37d245000000b00745f3200f54sm11293540qkj.112.2023.03.22.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:15:55 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:15:53 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Eric Blake <eblake@redhat.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] nbd: s/handle/cookie/
Message-ID: <20230321235250.GA1426669@localhost.localdomain>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lmQgSgxxt6.A.KGG.nGxGkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2406
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230321235250.GA1426669@localhost.localdomain
Resent-Date: Wed, 22 Mar 2023 14:33:12 +0000 (UTC)

On Fri, Mar 17, 2023 at 03:27:44PM -0500, Eric Blake wrote:
> v1 was here: https://lkml.org/lkml/2023/3/10/1162
> since then:
> - split original 1/3 into 1/5 and 5/5
> - new patch 2/5
> - reorder members of anon union
> - always send cookie in network order
> 
> Eric Blake (5):
>   uapi nbd: improve doc links to userspace spec
>   block nbd: send handle in network order
>   uapi nbd: add cookie alias to handle
>   block nbd: use req.cookie instead of req.handle
>   docs nbd: userspace NBD now favors github over sourceforge
> 
>  Documentation/admin-guide/blockdev/nbd.rst |  2 +-
>  drivers/block/nbd.c                        |  6 +++---
>  include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 8d3c682a5e3d9dfc2448ecbb22f4cd48359b9e21

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

