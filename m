Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0A43FEB1
	for <lists+nbd@lfdr.de>; Fri, 29 Oct 2021 16:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE98320251; Fri, 29 Oct 2021 14:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 29 14:51:10 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 311D020268
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 Oct 2021 14:34:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tD534YsZMDYN for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 Oct 2021 14:34:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x831.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E939320280
	for <nbd@other.debian.org>; Fri, 29 Oct 2021 14:34:18 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t40so9225687qtc.6
        for <nbd@other.debian.org>; Fri, 29 Oct 2021 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XiM+B9qyPSJmz+1nGIcnoNS9xSSaJAUzee605rT86OM=;
        b=X34VJuP893dPnyKj7tKDZS5M8bu1vj5GUEbKqC0ehlOgup3it/mOc80zNH2MD7O5sv
         L6Sok1uA+G0ndCy/c83EQ25tJbqOJtJ+sWgYAEywCf+ODAJyahVsmS1V9Ya1uXi6P4dC
         9ROX96pWoQaIrPqYl17HUBgUBvM5U/qqKvGfg1uly5yQsv70bZo4C2jIj4glbnGDmot4
         XOyoyqzgMiMF+keg6zrOiKfwYEMBxCG4F8wVzYK93GabPXiPZC8vp3jOzx1lhuqgzlGz
         fh+Z0QQ0bvFp5KF/7DTgS5aG0LV3rQOI6ktMEFTXGWZr7W5Yff2fvK/rCTo9VS+bjGL3
         gMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XiM+B9qyPSJmz+1nGIcnoNS9xSSaJAUzee605rT86OM=;
        b=3e+WbBiT4ZAYtNpfbqCgm/13h+Z8C8zExmReGEWoHVhe29nQH+8u4rC5SCm0fJ9sJa
         YLB2PIwLmyoxsXmc8EIIV5YZhJ5Ew6zNhErj2K6zNi5YYEzS+eGcVaBGQGFHvsfj/O1U
         a0a0cTSDyodoezEMz8bro87KQ/FfJyrNMQJfc8Afgu4h0fVzu5FneeVSgUj2s6RvlQIj
         i3ksSziKSmYMhzC0jF6SzIkP2JBPWWWG7xXpSsi0yMyQNQVd88xlKm1YF+/cPJsIbWts
         DCZECec2mUX9gu9r2+UYd5sYwHjmQbB0NZ67lJDXrgNMG9MXMj7kuuHvvxrcKyGNeVPv
         KoPg==
X-Gm-Message-State: AOAM532awpZInKId7IvySF/5RDZzqb+M7CRCnV62V0/heBEXpQweKFNa
	cyez+4Kb1Kdh4Wh91KDdf35+bw==
X-Google-Smtp-Source: ABdhPJwT0NumwZK7MrMRroChOnTroI0bTN/bQxliWUiDYlevjctMF4EdTbVW+0hQZXtexw4bI8eU1g==
X-Received: by 2002:a05:622a:28e:: with SMTP id z14mr12014795qtw.24.1635518054536;
        Fri, 29 Oct 2021 07:34:14 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id a15sm3925121qkp.17.2021.10.29.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 07:34:14 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:34:12 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v3 1/2] nbd: Fix incorrect error handle when
 first_minor big than '0xff' in nbd_dev_add
Message-ID: <YXwGZL+VIRhKwEgi@localhost.localdomain>
References: <20211029094228.1853434-1-yebin10@huawei.com>
 <20211029094228.1853434-2-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029094228.1853434-2-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ru6_rXtucSB.A.AHH.epAfhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1590
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YXwGZL+VIRhKwEgi@localhost.localdomain
Resent-Date: Fri, 29 Oct 2021 14:51:10 +0000 (UTC)

On Fri, Oct 29, 2021 at 05:42:27PM +0800, Ye Bin wrote:
> If first_minor big than '0xff' goto out_free_idr label, this will miss
> cleanup disk.
> 
> Fixes: b1a811633f73 ("block: nbd: add sanity check for first_minor")
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

