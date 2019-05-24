Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA5298D7
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 15:24:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 69DC520070; Fri, 24 May 2019 13:24:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 13:24:20 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4ED4620788
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 13:07:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4kN0-VsdSW6j for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 13:07:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-vk1-xa44.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 69B4D2078B
	for <nbd@other.debian.org>; Fri, 24 May 2019 13:07:47 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id j124so2100472vkb.4
        for <nbd@other.debian.org>; Fri, 24 May 2019 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jdBUUMv99kj0cqC35xVQ0vJ+lTbAYnC4lk5/+dSwqX8=;
        b=y7nfCg4b4hWh5cXtClN2G9IlPfZtmsJ3lCmnJcQFhJJFfR7Duny76GHmGWVmLX7JkN
         4BQJt1/DlmVVHNx6yxD8f1v1vebpwhOW/ZIYNZ2RvPKxui5ELigztwF3+awy6EBQw7wE
         m3Y2E5XpbLeF2AxgqwDhp4aX77GeAAP51wkhJr9AxhH+GkIXWwNH8VLVQGaBoN8GvqUp
         A8Sh1fZjhD6lSYCc2m9pwMqc/p7T2nlHT50o9OXZ1RUVaIxCKjYUX676pmynjMX0a5ue
         bReHsYh0ssps55JEZQvYZbYbEun8Ea/68G3H264PjF491twDM4RQQrC4Rib1pUZoFXKT
         CZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jdBUUMv99kj0cqC35xVQ0vJ+lTbAYnC4lk5/+dSwqX8=;
        b=CYad1JQjQHJ5Z4/dUbl0DKrviiTNu7tGUAM0wocFnnngfg7Hf9ONWKPfjNDHT8YBt5
         bfkmxe4fLXsD80CxDBDH3c2/PzwmKaFSIik4yCt6uAfjJOo9qqu4ujQUFztf3cNTre1J
         Y6K4Lqz5KJ3uS6JkWKKWUV+BvgCUh57tOMVPMyl/LqrGGiG8HQMY3r65g+PevdLXJPmS
         PW4TwnpaJmbbCocNAibWhrwjQjJa4krfPMghE8cd39xBrQ/RdZ2MsrtHum9gGRbNEA/F
         qKNFhkSBzY1hpUTMDQH4ueaxQeNHyO1zR/eRg9PpKZFJ/7KSHqFII2BiH0smlVvhIVh+
         4PbQ==
X-Gm-Message-State: APjAAAV5XPoIytvQcRAEOf0CQfLlZY4s8MMUy7NE1qNmrqkiOijf/vz+
	BYuD8ipNWfPY0ccIHesEzwZ4OA==
X-Google-Smtp-Source: APXvYqwvZqoB7HcLldyB5hnboWptllAQCHpm5/Temh8iNOZUGFHOn/N74uzD1wlGnZSad8s+yXbosA==
X-Received: by 2002:a1f:8d0b:: with SMTP id p11mr4674585vkd.31.1558703264670;
        Fri, 24 May 2019 06:07:44 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e914])
        by smtp.gmail.com with ESMTPSA id v14sm815351vkd.4.2019.05.24.06.07.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 06:07:43 -0700 (PDT)
Date: Fri, 24 May 2019 09:07:42 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] nbd: fix connection timed out error after
 reconnecting to server
Message-ID: <20190524130740.zfypc2j3q5e3gryr@MacBook-Pro-91.local.dhcp.thefacebook.com>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oC4vYtFUHIL.A.swH.EC_5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/517
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190524130740.zfypc2j3q5e3gryr@MacBook-Pro-91.local.dhcp.thefacebook.com
Resent-Date: Fri, 24 May 2019 13:24:20 +0000 (UTC)

On Fri, May 24, 2019 at 05:43:54PM +0800, Yao Liu wrote:
> Some I/O requests that have been sent succussfully but have not yet been
> replied won't be resubmitted after reconnecting because of server restart,
> so we add a list to track them.
> 
> Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>

Nack, this is what the timeout stuff is supposed to handle.  The commands will
timeout and we'll resubmit them if we have alive sockets.  Thanks,

Josef

