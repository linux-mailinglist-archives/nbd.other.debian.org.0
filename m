Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EFA0BAEB
	for <lists+nbd@lfdr.de>; Mon, 13 Jan 2025 16:03:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C4AB4204A4; Mon, 13 Jan 2025 15:03:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 13 15:03:11 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3757A2047C
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jan 2025 14:46:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vmQAQflNRA1U for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jan 2025 14:46:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8951220482
	for <nbd@other.debian.org>; Mon, 13 Jan 2025 14:46:40 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso303475339f.1
        for <nbd@other.debian.org>; Mon, 13 Jan 2025 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736779597; x=1737384397; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA3XuZUcsxz2VJKOnzZDbEDoiNe5aOSoYX7+SPjuhMs=;
        b=UTpg1+AzesFIb5ItczryWhD6FJSjcl6sTRgyyWTn4LmurDvvPSUSDC9nACi0xujqTt
         mBhdwPxVlJV8UXDmADzbZfeZ5g4zO5jNrI65RslpsS8OOXqKPy4aWoqXp29/yOg16/SF
         E/hYoYq0pLnXt+68HfsgCEOfx18LxQRxTXznAh9br7M7g/75HGGgFbVTgoszLAr62O5P
         dAqp5qlu3lC7XEM/6c/KPzDszyFDFhnMx/84GUw4ZcJuOq2aOnNsM2TIDnA3xAue5HeC
         orR89gAvxUO14CJBKpSj9LPc5snvTUm5gyxXZa6mhrabkjQy/wbn88+jA+z6X7vd4nt+
         6YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779597; x=1737384397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA3XuZUcsxz2VJKOnzZDbEDoiNe5aOSoYX7+SPjuhMs=;
        b=BGipV3ICEcKv7dkcWNs1v+fKs8xQWjQr/0tQl5krPx3F24d+DPuv488ek8uR6Fkm2W
         iTFnLDtNPqqfoDJUoMnxTCP3ClUECHIEleD0cn3NYpmbdmxJG3jrR61a4NMZMkfN6YEG
         VQTT86RhMWkLdJQgDYF07QK48SRW0CkReYYrrY8NwyAUx6rFu1WNy3GOVHR6so2xm/L8
         yv3lpaLpwvN2XefTpRITAluFDfcyDvNe7WzEUDuIkLnj9TIOrlsHFKUspElQnPcpx8sy
         ndbDW9WfAJ9NgFju08gMOsFdG8ueyVFLgfrT8IdfiZVdtDvkCWExuWx9d7RTmjHN87pw
         dK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXegOVbX7JczscRFtqs5fghzFKWgJkHd9QTRxN3TSRM+PF8BL0T0emPOap1uHJhSFcUGg=@other.debian.org
X-Gm-Message-State: AOJu0YxnA8ukOEBlqg0gr2LxkB4bJCMc2Ld/iAfC8MaeJa69J43DZl4V
	dt26CPMWDlQO8obTcjA+XzCvlWNTN6Zb+bEROpIlRBec2LGXjhoml1sXJ4mXQFQ=
X-Gm-Gg: ASbGncudHBGp9Q/+UYKAFcokrrMLBSWpunv9lDl9gpjBVpr6tDKuWU6yxCKpYxDohbD
	4nhm36/63bpgQpvSQrzICBL53Zah5CtkFiZ7kXhkkHel3BAl+0hQrzmODLwnWDffI46/+amHkuo
	/666RpYehOFlzLe0QM4RKNrIaEhOsI6MZdA3/6AnnjCZHMyveLqtUKvB6T6qbYf+4Hkp/3CLcfC
	K9+LcOo/P/G3ee0GBQ1aGY2cUW0d9toCZEdpktPDC84sdQ=
X-Google-Smtp-Source: AGHT+IHa+TdSTDRBieysJQf9I1GsQ07SWRHmNbPAW3j2m0fkSZwFAzoyyTMnwpKlhpJ+sKNW10F5Xw==
X-Received: by 2002:a05:6e02:1f8a:b0:3a7:e528:6f1e with SMTP id e9e14a558f8ab-3ce3a8880c6mr161100605ab.11.1736779596982;
        Mon, 13 Jan 2025 06:46:36 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7178d1sm2790840173.95.2025.01.13.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:46:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Cc: josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com, 
 vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>, 
 Bart Van Assche <bvanassche@acm.org>, Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <20241029011941.153037-1-ming.lei@redhat.com>
References: <20241029011941.153037-1-ming.lei@redhat.com>
Subject: Re: [PATCH V3] nbd: fix partial sending
Message-Id: <173677959574.1124551.15074727765377070500.b4-ty@kernel.dk>
Date: Mon, 13 Jan 2025 07:46:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XbY61ejjbwM.A.l3XI.vsShnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3355
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/173677959574.1124551.15074727765377070500.b4-ty@kernel.dk
Resent-Date: Mon, 13 Jan 2025 15:03:11 +0000 (UTC)


On Tue, 29 Oct 2024 09:19:41 +0800, Ming Lei wrote:
> nbd driver sends request header and payload with multiple call of
> sock_sendmsg, and partial sending can't be avoided. However, nbd driver
> returns BLK_STS_RESOURCE to block core in this situation. This way causes
> one issue: request->tag may change in the next run of nbd_queue_rq(), but
> the original old tag has been sent as part of header cookie, this way
> confuses nbd driver reply handling, since the real request can't be
> retrieved any more with the obsolete old tag.
> 
> [...]

Applied, thanks!

[1/1] nbd: fix partial sending
      commit: 8337b029f788272f5273887ccefb8226404658ce

Best regards,
-- 
Jens Axboe



