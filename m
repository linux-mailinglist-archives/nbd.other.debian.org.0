Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A8179892
	for <lists+nbd@lfdr.de>; Wed,  4 Mar 2020 20:06:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 664ED201BC; Wed,  4 Mar 2020 19:06:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 19:06:19 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D8DA620194
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2020 18:48:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XIrXxZsipoOU for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2020 18:48:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x744.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 045842015A
	for <nbd@other.debian.org>; Wed,  4 Mar 2020 18:48:42 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f198so2678575qke.11
        for <nbd@other.debian.org>; Wed, 04 Mar 2020 10:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gaiPqDNxbGjPvULcXVentH2r0KxuB6YZ5QjsMBCeHec=;
        b=mYQorKfWcmDjXtRuYROKlRZpSkDVPpQBNo5QcfOAqIMq6EBk2ZMjEnfys92dBcDr/g
         j9+19Z8mBniWXU9Opl5/9fF42M50sq3jQjrRAoDNvc4/9iImQe/qG3Z0wEYtaDMJgpBD
         Y+PbGCyuiELp7lf4TyUga6lc2iWbtB6WajEcH6iPgGuEr7RPH66llE6ZtamsM4gzmqVL
         ERk6EujU4NEFgbob5rebVMoYBt0S33Yu/D4vRXzBTNgdk82sytG7ofEJXasmLpyLV5WY
         6jZKsbsslCeFR3QsiYh0SmhUoxPWMpHMLydNa47e5+cO6H3utog4xptQZsR737Gv6D6G
         LY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gaiPqDNxbGjPvULcXVentH2r0KxuB6YZ5QjsMBCeHec=;
        b=UqoCWIIZTJoiuk+2v3A9aNY2rFY7tCPNvi8pD0+weD6OVqBXLvH6hC0EAiPghDrGqB
         l7QFIgAoD0PKMcKiYWRdAE82CLSCKecnGCvds5Zqncgml6j4/o+B3IGNETQlTpHFM9nz
         rqw7OjrMriBQgCG0KjjfpWqRSBe4cI/aUkSy0rLpSoOi3h9cdOaqjUybNpmokDSEymPy
         MjWHr9a+oA6cWDRn0Qw9VO2uN+7x203StbARfYthQ1kQ7+wgeVFirUL69iXmpEBCzbQ/
         vcv3KX2BoMvmQHaBr4y9I4ybLEj1zJOJSXt2B2QgsTdv4ieI0jdY6jqZY4OmfFCjx4Xd
         srZA==
X-Gm-Message-State: ANhLgQ1JaN3pv3NOaz4zpiXzDz2S5v42IjOW9S3gnbOFHuFAlrPudSmG
	oOa/SbFyfoT/2dicagHRC390fQ==
X-Google-Smtp-Source: ADFU+vsI5evWFOKkqNQUBS2xdCXb3Ty9BF9CjXGr19/96KNNE11UK2M6OYOr7n87JSPQC4u+HzE4pQ==
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr4336143qkj.312.1583347719821;
        Wed, 04 Mar 2020 10:48:39 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id x203sm795338qkb.44.2020.03.04.10.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 10:48:39 -0800 (PST)
Subject: Re: [PATCH 2/2] nbd: requeue command if the soecket is changed
To: Hou Pu <houpu.main@gmail.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-3-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <0f3dd5e9-a2e2-3b05-7ad8-292a481e3006@toxicpanda.com>
Date: Wed, 4 Mar 2020 13:48:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228064030.16780-3-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IWZPBPyybkK.A.jVE.rw_XeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/850
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0f3dd5e9-a2e2-3b05-7ad8-292a481e3006@toxicpanda.com
Resent-Date: Wed,  4 Mar 2020 19:06:19 +0000 (UTC)

On 2/28/20 1:40 AM, Hou Pu wrote:
> In commit 2da22da5734 (nbd: fix zero cmd timeout handling v2),
> it is allowed to reset timer when it fires if tag_set.timeout
> is set to zero. If the server is shutdown and a new socket
> is reconfigured, the request should be requeued to be processed by
> new server instead of waiting for response from the old one.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

