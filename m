Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 871ECCE5212
	for <lists+nbd@lfdr.de>; Sun, 28 Dec 2025 16:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 46E27204DB; Sun, 28 Dec 2025 15:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Dec 28 15:48:11 2025
Old-Return-Path: <yskelg@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0C4C220463
	for <lists-other-nbd@bendel.debian.org>; Sun, 28 Dec 2025 15:32:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.993 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dYHgj4sLPgch for <lists-other-nbd@bendel.debian.org>;
	Sun, 28 Dec 2025 15:31:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 IX_MANITU=ERR(0) CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pf1-f181.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CC92420462
	for <nbd@other.debian.org>; Sun, 28 Dec 2025 15:31:49 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7d481452588so465834b3a.3
        for <nbd@other.debian.org>; Sun, 28 Dec 2025 07:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766935906; x=1767540706;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3giXc7cMCSGUFXOKi1Hwd005/JIfiixxxlHayPGWOA=;
        b=IDWGUSIB61NzRmkK+5IOTAsCC5IpdWKbKclCaam2dN89OzW7Rey2uGVzczzledF3l8
         MfX818Dkc/K1fKJm+0XC1TlTVHoVuDqwaumr8OFi9J5/RRUqVSy7Ai1YYhkyfoj/fCmZ
         AtGaxGZ5Il/LQS1XXhYmkmYCtxUj+gFEzfPsLv8WGeNS/ENYijcNgtppXS+VYLusLWwa
         F3EblE3RKYNORjt2J1CIT3F79lTC6A9EnKmAUTi8C8kYHDiYLbw6di5bIODxC6TZfmNR
         j3beyvDR91+5sDDOnB+VXN7BeKKiifejU7psk99Zq3AYxJHrEUgjBdyG4ydU+73MrP0g
         mGvA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9UKMvYr6URmJjW7VUs8ob9ecZsv8aGHq8BK05z0QhcJrjXpm5UsuaD4s/ROr61U1jqI=@other.debian.org
X-Gm-Message-State: AOJu0Yx1dHS7OlSl4aeisqGKiaq9o5OncJGjVolvQXCXIGRFEW8SMnmO
	tA4SfNxRorpc8/WELsZ4V5BmmzdPL/7H4dsFNfwouX4GnQJ6UasqXSPmH9IS2SV1
X-Gm-Gg: AY/fxX4Ydd8nIBlBPJlazAgUGsY3UaM519B6YXizxgMvZHtWRuvNf6NMBpKWtGaOV11
	mJGSdJdDFr/mBrTukJA4TudpcOrtPftw9mvu12861UrgE/N+uNW/4LS8/CNaQHsurwAl1v/6xt3
	PoTRkqO3D4vHg9yJ5nbLSqYu+qS6HHsH+3vHzlorbAPbLkjDQO3Ep3ISnn/0cbLvSBbLk0lwoz2
	fwgrNlO/YqRAqUxopr0+P7LerBk4qfuZlUWPYiO7ye0FL9l7rRhWEK/cfZdOZITOTgKo2SIXnNU
	ZerR2bsle6HBuTrvg2RDSp9IML86m68y1hdZel1jzuWzV+PWxVSMFTQl6TlqaTa2QtJzskg2v5c
	aJa7xHQMxrSLTVvJsjI165uR0M4rvv6x53EicoM91NCcUhrj5BM6ymVL19VjlerV0pntUomoym8
	hTHqYZG6OD7IJu9dUNXgty9M2O0vtmjhMWawAHWA3Ru4HTpt7e/xEvoIQ1unfk8OMa3rJge+m0r
	J5g9FB5dMRLnTs=
X-Google-Smtp-Source: AGHT+IFr0ZucNr4VFDClQuZ7TPKtjMJ90y9eR4fV8HfQTDA8PNhwmjBQ4ENKcX8QrvWJz3Z+1QBvlQ==
X-Received: by 2002:a05:6a00:951b:b0:7ab:3883:36 with SMTP id d2e1a72fcca58-7ff67852b0amr18685569b3a.4.1766935905654;
        Sun, 28 Dec 2025 07:31:45 -0800 (PST)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm27077545b3a.17.2025.12.28.07.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 07:31:45 -0800 (PST)
Message-ID: <a482c91f-4acd-4799-88bd-ce9c6c0f53b1@kzalloc.com>
Date: Mon, 29 Dec 2025 00:31:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: fix build failure after openunix/opennet refactor
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, Pavel Machek <pavel@kernel.org>,
 nbd@other.debian.org
References: <20250915002941.937139-2-ysk@kzalloc.com>
 <aVDkryhNK5xNcOGF@pc220518.home.grep.be>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <aVDkryhNK5xNcOGF@pc220518.home.grep.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ixqYCdJyzkJ.A.2od.7EVUpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3484
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a482c91f-4acd-4799-88bd-ce9c6c0f53b1@kzalloc.com
Resent-Date: Sun, 28 Dec 2025 15:48:11 +0000 (UTC)

Hi Wouter,

On 12/28/25 5:05 PM, Wouter Verhelst wrote:
> Hi there,
> 
> Sorry for the late reply; applied.
No problem, I'd love to get involved with the NBD subsystem!

I'm interested in improving NBD robustness and security. Which communication
channels are most active for the NBD subsystem? I'm currently diving into
the NBD kernel code and would appreciate any guidance on where to start.

Thank you!

Best regards,
Yunseong Kim

